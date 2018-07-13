import sys
import getpass
import json
import pprint
from testrail import APIClient

url = 'https://bsro.testrail.net' 
client = APIClient(url)
client.user = 'igor.nesvit@icrossing.com'
client.password = sys.argv[1]

#def usage():
#  print("[!] Usage: tr_conn.py -p password")
#  for eachArg in sys.argv:   
#        print(eachArg)

def get_creds():
  print ("[<] Enter TestRail login:\n")
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

def get_suites(project_id):
  result = client.send_get('get_suites/' + str(project_id))
  p = pprint.PrettyPrinter(indent=4)
  print("[.] list of suites for project with id: ", project_id)
  for i in range(len(result)):
    p.pprint(result[i]['name'] + " id: " + str(result[i]['id']))

def get_cases(project_id, suite_id):
  result = client.send_get('get_cases/1&suite_id=94')
  p = pprint.PrettyPrinter(indent=4)
  print("[.] list of cases for project_id: %s and suite_id: %d" % (project_id, suite_id))
#  p.pprint(result)
  for i in range(len(result)):
    p.pprint(str(result[i]['title']))

def get_sections(project_id, suite_id):
  result = client.send_get('get_sections/1&suite_id=94')
  p = pprint.PrettyPrinter(indent=4)
  print("[.] list of sections for project_id: %s and suite_id: %d" % (project_id, suite_id))
  p.pprint(result)
  for i in range(len(result)):
    ret = p.pprint(str(result[i]['id']))
  return ret

def add_result(test):
  print("[+] add result to a test: ")

def get_plans(project_id):
  result = client.send_get('get_plans/' + str(project_id))
  p = pprint.PrettyPrinter(indent=4)
  print("[.] list of plans for project with id: ", project_id)
  for i in range(len(result)):
    p.pprint(result[i]['name'] + " id: " + str(result[i]['id']))

def main():
  get_creds()
  get_projects()
  get_suites(1)
  get_cases(1, 94)
  get_sections(1, 94)
  get_plans(1)
  if input_yes_no("[?] Add a bunch of new test cases ? "):
    print ("[+] Added N gazzilion test cases")

main()
