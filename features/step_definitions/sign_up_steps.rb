Given(/^I am on the sign up page$/) do
  visit "/users/new"
end

When(/^I submit form with empty name$/) do
  find("#submit").click
end

Then(/^I should see error stating "([^"]*)"$/) do |arg|
  page.should have_content(arg)
end

When(/^I submit form with empty password$/) do
  find("#submit").click
end

When(/^I submit form with empty email id$/) do
  find("#submit").click
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in(arg1,with: arg2)
end

And(/^I submit form$/) do
  find("#submit").click
end