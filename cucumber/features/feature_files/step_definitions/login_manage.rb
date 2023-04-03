Given(/^I am on the home page$/) do
    visit "/home"
  end

  When(/^I click Login$/) do
    find("#login").click
  end

  Then(/^I should be redirected to the Login Page$/) do
    visit "/login"
  end

Given(/^I am on the login page$/) do
    visit "/login"
  end

  When(/^I enter enter my username and password$/) do |field, value|
    fill_in(field, with: value)
  end

  Then(/^I click login$/) do
    find("#Log in").click
  end
  Then(/^I should be redirected to the admin page$/) do
    visit "/admin"
  end
Given(/^I am on the admin page$/) do
    visit "/admin"
  end

  When(/^I click view all user button$/) do
    find("#VIEW ALL USERS").click
  end

  Then(/^I should be redirected to users page$/) do
    visit "/users"
  end
  Then(/^I click delete button for one user account that no longer needed$/) do |name|
    user = User.find_by name:name
    find("#delete").click
  end
  Then(/^I click Ok/) do
    find("#OK").click
  end
  And(/^I will Successfully delete that user account/) do
  end
