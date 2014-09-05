Given(/^I am on the menu page$/) do
  visit '/menu'

  expect(page).to have_content('Welcome to TwilioTakeaway')
 end

Given(/^I will see the user name$/) do
  expect(page).to have_content('What do you fancy to eat today')
end

Given(/^Some takeaway restaurants$/) do
  expect(page).to have_selector('.restaurants > .vendor')
end