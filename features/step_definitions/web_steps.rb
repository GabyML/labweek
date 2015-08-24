Given(/^I visit index page$/) do
  visit '/'
end

Given(/^I visit the sign up page$/) do
  visit '/users/new'
end

Given(/^there is already a user with username "([^"]*)"$/) do |arg1|
  user = User.create(email: 'sally@email.com', username: arg1, password: '1234', password_confirmation: '1234')
end

Given(/^there is already a user with email "([^"]*)"$/) do |arg1|
  user = User.create(email: arg1, username: 'Sally', password: '1234', password_confirmation: '1234')
end

Given(/^I am logged in$/) do
  user = User.create(email: 'sally@email.com', username: 'Sally', password: '1234', password_confirmation: '1234')
  session[:user_id] = user.id
end

Given(/^I have an account with username "([^"]*)" and password "([^"]*)"$/) do |arg1, arg2|
  user = User.create(email: 'dilbert@email.com', username: arg1, password: arg2, password_confirmation: arg2)
end


When(/^I click the "([^"]*)" button$/) do |arg1|
  click_on arg1
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end
