from selenium import webdriver
import sys
import time

repository_name = str(sys.argv[1])

while True:
    user_input = input('Private? (y/n): ').lower()
    if  user_input == 'n':
        private = False
        break
    elif user_input == 'y':
        private = True
        break
while True:
    user_input = input('Make Gitignore File? (y/n): ').lower()
    if  user_input == 'n':
        gitignore = False
        break
    elif user_input == 'y':
        gitignore = True
        break
while True:
    user_input = input('Make README File? (y/n): ').lower()
    if  user_input == 'n':
        readme = False
        break
    elif user_input == 'y':
        readme = True
        break

browser = webdriver.Chrome('/Users/joeylee/chromedriver')
browser.get('https://www.github.com/login')

login_form = browser.find_element_by_id("login_field")
login_form.send_keys(open(r'/Users/joeylee/Documents/GitHubProjects/RepoAutomations/email.txt','r').read())
password_form = browser.find_element_by_id("password")
password_form.send_keys(open(r'/Users/joeylee/Documents/GitHubProjects/RepoAutomations/password.txt','r').read())

login_button = browser.find_element_by_name('commit').click()

browser.get('https://www.github.com/new')

repository_name_form = browser.find_element_by_name('repository[name]')
repository_name_form.send_keys(repository_name)

if private:
    private_button = browser.find_element_by_id('repository_visibility_private').click()
if gitignore:
    gitignore_button = browser.find_element_by_id('repository_gitignore_template_toggle').click()
if readme:
    readme_button = browser.find_element_by_id('repository_auto_init').click()

time.sleep(0.5)

create_button = browser.find_element_by_xpath('//*[@id="new_repository"]/div[4]/button').click()
browser.close()