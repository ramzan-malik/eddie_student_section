*** Settings ***

Documentation    A reusbale fil similar to Baseclass that
...              that has similar function as of Baseclass

Library     SeleniumLibrary



*** Variables ***

${username}                             //input[@id='email']
${valid_password}                       //input[@id='password']
${click_login_btn}                      xpath=//button[normalize-space()='Sign in']
${login_remember_me_toggle}             //input[@id='flexSwitchCheckChecked']
${base_url}                             http://app-qa.nykey.org/
${browser_name}                         Chrome

*** Keywords ***

Open Chrome Browser With URL
#    Create Webdriver    Chrome      executable_path=F:/webdrivers_automation/chromedriver-win64/chromedriver-win64/chromedriver.exe        options=add_argument("--start-maximized"); add_experimental_option("detach", True)
#    Go To    https://www.vconnectlive.com/


#      Open Browser        ${base_url}            ${browser_name}         options=add_argument("--start-maximized"); add_experimental_option("detach", True)
      Open Browser        ${base_url}             ${browser_name}         options=add_argument("--headless")        # For Jenkins Ubuntu Server
      Sleep               2

#     Open Browser        ${base_url}            chrome                      executable_path=/home/ubuntu/chromedriver-download/chromedriver-linux64/chromedriver
#     Sleep               2
#     Open Browser        ${base_url}            ${browser_name}         executable_path=F:/webdrivers_automation/chromedriver-win64/chromedriver-win64/chromedriver.exe        options=add_argument("--start-maximized"); add_experimental_option("detach", True)
#     Open Browser        ${base_url}            ${browser_name}        # for send variable as browser_name command through terminal for selecting browser at run time



Enter Email Id and Password to Login

	[Arguments]             ${username}                     ${valid_password}
	Input Text              ${username}                     dashboard@nykey.org
	Input Password          ${valid_password}               12345678
	Execute JavaScript      window.scrollTo(0, document.body.scrollHeight)
	Sleep                   2
	Click Element           ${login_remember_me_toggle}
	Click Element           ${click_login_btn}

Close Browser Session
	Close Browser