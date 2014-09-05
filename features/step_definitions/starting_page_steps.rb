Given(/^We are on the homepage$/) do
	visit '/'
end

When(/^We see a form for name and telephone number$/) do
  expect(page).to have_content('Welcome to TwilioTakeaway')

  expect(page).to have_selector('form')
  expect(page).to have_selector('input[name=client]')
  expect(page).to have_selector('input[name=telephone]')
end

When(/^We enter our details$/) do
	fill_in 'client',    :with => 'Albert'
	fill_in 'telephone', :with => '+447720800376'
end

When(/^We submit our details$/) do
  find('input[type=submit]').click
end

Then(/^We are log in and ready to order$/) do
  visit '/menu'
end