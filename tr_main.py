import sys
import json
import pprint
import getpass
import argparse
from testrail import APIClient
from subprocess import PIPE, call, run

parser = argparse.ArgumentParser(description='Run all *approved* test cases for specified test plan')

parser.add_argument('-u', action='store', dest='username', help='TestRail login username for ex. me@someplace.com', required=True)
parser.add_argument('-p', action='store', dest='password', help='TestRail login password', required=True)
parser.add_argument('--tpid', action='store', dest='tpid', help='TestRail test plan ID, ex. R2330 ', required=True)
parser.add_argument('--url', action='store', dest='url', help='TestRail url, default set to https://bsro.testrail.net', default='https://bsro.testrail.net')
results = parser.parse_args()

url = results.url
client = APIClient(url)
client.user = results.username
client.password = results.password
tpid_argv = results.tpid[1:]

def get_creds():
  if len(client.user) < 1: 
    client.user = input("login: ") 
  if len(client.password) < 1:
    client.password = getpass.getpass()
    if len(client.password) < 1:
      print("[ha!] forgot something?....where's the password ?")
      sys.exit(0)
  print("[.] k, got the creds for ", client.user)

def input_yes_no(question, default="yes"):
    valid = {"yes": True, "y": True, "ye": True,
             "no": False, "n": False}
    if default is None:
        prompt = " [y/n] "
    elif default == "yes":
        prompt = " [Y/n] "
    elif default == "no":
        prompt = " [y/N] "
    else:
        raise ValueError("invalid default answer: '%s'" % default)

    while True:
        sys.stdout.write(question + prompt)
        choice = input().lower()
        if default is not None and choice == '':
            return valid[default]
        elif choice in valid:
            return valid[choice]
        else:
            sys.stdout.write("Please respond with 'yes' or 'no' "
                             "(or 'y' or 'n').\n")

def get_projects(): 
  result = client.send_get('get_projects')
  p = pprint.PrettyPrinter(indent=4)
  print("[.] list of projects:")
  for i in range(len(result)):
    p.pprint(result[i]['name'] + " id: " + str(result[i]['id']))

def get_suites(projectid):
  result = client.send_get('get_suites/' + str(projectid))
  p = pprint.PrettyPrinter(indent=4)
  print("[.] list of suites for project with id: ", projectid)
  for i in range(len(result)):
    p.pprint(result[i]['name'] + " id: " + str(result[i]['id']))

def get_case_status(status_id):
  s = ["None", "Draft", "Needs Update", "Updated", "Approved"]
  return s[status_id]

def get_sections(projectid, suiteid):
  result = client.send_get('get_sections/1&suite_id=94')
  p = pprint.PrettyPrinter(indent=4)
  print("[.] list of sections for project_id: %s and suite_id: %d" % (projectid, suiteid))
  p.pprint(result)
  return result[0]['id']

def get_plans(projectid):
  result = client.send_get('get_plans/' + str(projectid))
  p = pprint.PrettyPrinter(indent=4)
  print("[.] list of plans for project with id: ", projectid)
  for i in range(len(result)):
    p.pprint(result[i]['name'] + " id: " + str(result[i]['id']))

def get_runs(planid):
  run_ids = [] 
  print("[*] getting runs for planid:", planid)
  result = client.send_get('get_plan/' + str(planid))
  runs_count = len(result['entries'])
  print("[*] Number of runs:", str(runs_count))
  for i in range(runs_count):
    runid =  result['entries'][i]['runs'][0]['id']
    print("[" + str(i) + "] runid: " + str(runid) + ", runname: " + str(result['entries'][i]['runs'][0]['name']))
    run_ids.append(runid)
  return run_ids

def get_tests(runid, default=""):
  test_ids = []
  if default == "2331":
    runid = default  
  print("[*] getting tests for runid:", runid)
  result = client.send_get('get_tests/' + str(runid))
  for i in range(len(result)):
    print("[" + str(i) + "] testid: " + str(result[i]['id']) + ", testname: " + result[i]['title'] + ", case status: " + get_case_status(result[i]['custom_case_status']))
    test_ids.append(result[i]['id'])
  return test_ids

def get_test_filename(testid, approved=True):
  filename = ""
  result = client.send_get('get_test/' + str(testid))
  case_status = result['custom_case_status']
  if approved:
    if  case_status == 4:
      filename  = find_testcase_file(build_filename_from_case(result))
  else:
    filename = find_testcase_file(build_filename_from_case(result))

  return filename
  
def build_filename_from_case(case_json):
  filename = "TRCID" + str(case_json['case_id']) + "_" + case_json['title'] + ".py"
  return filename

def find_testcase_file(filename):
  # DESC: Just a place holder for now
  # TODO: check if file exist, do some try catch for file io
  return filename

def exec_test_case(filename):
  tr_status = 4
  execv_dir = "./TestSuiteNAME0001"
  execv_cmd = ['pytest', '-q', '--junitxml=' + execv_dir + '/report/junitResult.xml',  '--html=' + execv_dir + '/report/report.html', execv_dir + '/' + filename]
  print ("[-] about to exec: ", execv_cmd)
  result = run(execv_cmd, stdout=PIPE, stderr=PIPE, universal_newlines=True)
  #print("RC: " + str(result.returncode) + ", STDOUT:" + result.stdout + ", STDERR:" + result.stderr)
  ret = result.returncode
  stdout = result.stdout
  if ret != 0:
    print("[FAILED] rc =", ret)
    tr_status = 5
  else:
    print("[OK] success, rc = ", ret)
    tr_status = 1
  return tr_status, stdout

def add_result(testid, statusid, stdout):
  result = client.send_post('add_result/'+ str(testid), {'status_id': statusid, 'comment':'[*] Automated testing via py scripts output:\n' + stdout})

def update_test_results(testid, statusid, stdout):
  status_list = ["None", "Pass", "Blocked", "Untested", "Retest", "Failed"]
  add_result(testid, statusid, stdout)
  print("[+] Result for testid: " + str(testid) + " updated to: " + str(status_list[int(statusid)]))
   
def main():
  approved = True
  approved_stamp = ""
  exec_ready_files = []

  get_creds()
  run_ids = get_runs(tpid_argv)
  for i in range(len(run_ids)):
    test_ids = get_tests(run_ids[i])
    for j in range(len(test_ids)):  
      filename = get_test_filename(test_ids[j], approved)
      if approved: approved_stamp = "APPROVED"
      if len(filename) > 0: 
        print("[main] " + approved_stamp + " TestCase filename: " + filename)
        exec_ready_files.append((test_ids[j], filename))

  if len(exec_ready_files) > 0:
    if input_yes_no("Run tests? "):
      print("[+] Running tests...") 
      for i in range(len(exec_ready_files)):
        status, stdout = exec_test_case(exec_ready_files[i][1])
        update_test_results(exec_ready_files[i][0], status, stdout)
    else:
      print("[-] no action, exiting...")

main()
