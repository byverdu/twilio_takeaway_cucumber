Feature: We want to order some food
	We decide to access to  the web
	Where we can order some food

Scenario: Starting to order
	Given  We are on the homepage
	When   We see a form for name and telephone number
	And    We enter our details
	And    We submit our details
	#And    If the user do not enter the fields, try again
	Then   We are log in and ready to order
