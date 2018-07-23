import unittest
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities


class GoogleTestCase(unittest.TestCase):

    def setUp(self):
        self.browser = webdriver.Remote(command_executor='http://selenium-hub.grid:4444/wd/hub', desired_capabilities=DesiredCapabilities.CHROME) 
        self.addCleanup(self.browser.quit)

    def testPageTitle(self):
        self.browser.get('http://www.google.com')
        self.assertIn('Google', self.browser.title)

if __name__ == '__main__':
    unittest.main(verbosity=4)
