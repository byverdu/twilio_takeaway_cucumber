Feature: On the menu page
	We are going to be able to select dishes from a menu
	After selecting our order 
	We will send a message to the takeaway restaurant
	We will receive a message with the time that the order will be at home


Scenario: I am on the menu page
	Given I am on the menu page
	And   I will see the user name 
	And   Some takeaway restaurants 
	When  I am selecting a restaurant
	Then  I will see the menu
	When  I am selecting the dishes
	Then  I can place the order