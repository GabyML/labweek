Given(/^I visit index page$/) do
  visit '/'
end

Given(/^I visit the sign up page$/) do
  visit '/users/new'
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
