import argparse

parser = argparse.ArgumentParser(description='Run all *approved* test cases for specified test plan')

parser.add_argument('-u', action='store', dest='username', help='TestRail login username for ex. me@someplace.com', required=True)
parser.add_argument('-p', action='store', dest='password', help='TestRail login password', required=True)
parser.add_argument('--tpid', action='store', dest='tpid', help='TestRail test plan ID, ex. R2330 ', required=True)
parser.add_argument('--url', action='store', dest='url', help='TestRail url, default set to https://bsro.testrail.net', default='https://bsro.testrail.net')

results = parser.parse_args()

print (results.username, results.password, results.tpid[1:], results.url)
