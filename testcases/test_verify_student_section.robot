*** Settings ***

Documentation       End to End Testing Flow
Library             SeleniumLibrary
Library             Collections             # for "Append to List" keyword
Test Setup         Open Chrome Browser With URL
Test Teardown       Close Browser Session         #it will always run after text execution
Resource            ../PageObjects/GenericPage.robot
#Resource            ../PageObjects/LoginPage.robot



*** Variables ***

${url_to_verify}
${success_block_element_to_verify}              //li[@class='breadcrumb-item active']
${success_block_btn_element_to_verify}          //a[@class='btn btn-success']





*** Test Cases ***

test_student_dashboard.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/home/students              Sun
	Sleep    3


test_student_browse_course.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/browse/courses               Browse Course
	Sleep    3


test_student_browse_webinar.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/browse/webinar               Browse Webinar
	Sleep    3


test_student_course.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/students/0/course            Course
	Sleep    3


test_student_assignment.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/assignments                  Assignment List
	Sleep    3


test_student_attendance.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/students/0/attendance         Attendance
	Sleep    3


test_student_invoices.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Sleep    3
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/invoices/student/0/show      Invoices
	Sleep    3



*** Keywords ***

Verify User Successfully Logged In
	${current_url} =        Get Location
	Should Contain          ${current_url}       /home


Verify Link and Success Block Element of the page

	[Arguments]                             ${url_to_verify}                        ${success_block_element_to_verify}
	Go To                                   ${url_to_verify}
	Sleep                                   2
	Wait Until Page Contains                ${success_block_element_to_verify}
	Page Should Contain                     ${success_block_element_to_verify}