from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import sys

repository_name = str(sys.argv[1])

browser = webdriver.Chrome('/Users/joeylee/chromedriver')
browser.get('https://www.github.com/login')

login_form = browser.find_element_by_id("login_field")
login_form.send_keys(open(r'/Users/joeylee/Documents/GitHubProjects/RepoAutomations/email.txt','r').read())
password_form = browser.find_element_by_id("password")
password_form.send_keys(open(r'/Users/joeylee/Documents/GitHubProjects/RepoAutomations/password.txt','r').read())

login_button = browser.find_element_by_name('commit').click()

browser.get('https://github.com/JoeyLee-22/'+repository_name+'/settings')

delete_button = browser.find_element_by_xpath('//*[@id="options_bucket"]/div[9]/ul/li[4]/details/summary').click()

check = browser.find_element_by_xpath('//*[@id="options_bucket"]/div[9]/ul/li[4]/details/details-dialog/div[3]/form/p/input')
check.send_keys('JoeyLee-22/'+repository_name)
check.send_keys(Keys.RETURN)

browser.close()