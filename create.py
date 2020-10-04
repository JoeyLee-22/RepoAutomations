from selenium import webdriver
import sys
import time

repository_name = str(sys.argv[1])

browser = webdriver.Chrome('/Users/joeylee/chromedriver')
browser.get('https://www.github.com/login')

login_form = browser.find_element_by_id("login_field")
login_form.send_keys(open(r'email.txt','r').read())
password_form = browser.find_element_by_id("password")
password_form.send_keys(open(r'password.txt','r').read())

login_button = browser.find_element_by_xpath('//*[@id="login"]/form/div[4]/input[9]').click()

browser.get('https://www.github.com/new')

repository_name_form = browser.find_element_by_xpath('/html/body/div[4]/main/div/form/div[2]/auto-check/dl/dd/input')
repository_name_form.send_keys(repository_name)

private_button = browser.find_element_by_xpath('//*[@id="repository_visibility_private"]').click()

time.sleep(0.5)

create_button = browser.find_element_by_xpath('//*[@id="new_repository"]/div[4]/button').click()

browser.close()