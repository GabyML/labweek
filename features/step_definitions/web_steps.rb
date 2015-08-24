Given(/^I visit index page$/) do
  visit '/'
end

When(/^I click the "([^"]*)" button$/) do |arg1|
  click_on arg1
end