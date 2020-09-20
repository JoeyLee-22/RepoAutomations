from selenium import webdriver
import sys

repository_name = str(sys.argv[1])

browser = webdriver.Chrome('/Users/joeylee/chromedriver')
browser.get('https://www.github.com/login')

login_form = browser.find_element_by_id("login_field")
login_form.send_keys(open(r'email.txt','r').read())
password_form = browser.find_element_by_id("password")
password_form.send_keys(open(r'password.txt','r').read())

login_button = browser.find_element_by_xpath('//*[@id="login"]/form/div[4]/input[9]')
login_button.click()

browser.get('https://github.com/JoeyLee-22/'+repository_name+'/settings')

delete_button = browser.find_element_by_xpath('//*[@id="options_bucket"]/div[10]/ul/li[4]/details/summary').click()

check = browser.find_element_by_xpath('//*[@id="options_bucket"]/div[10]/ul/li[4]/details/details-dialog/div[3]/form/p/input')
check.send_keys('JoeyLee-22/'+repository_name)

delete_button2 = browser.find_element_by_xpath('//*[@id="options_bucket"]/div[10]/ul/li[4]/details/details-dialog/div[3]/form/button').click()

browser.close()