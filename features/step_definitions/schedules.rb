Given(/^I am on the view page$/) do
    visit "/view"
end
  
When(/^I click on remove all schedules button$/) do 
    find("#remove").click
end
  
Then(/^All schedules will be removed$/) do
    visit "/view"
end

Given(/^I am on the admin home page$/) do
    visit "/admin"
end

When(/^I click Upload Schedule$/) do
    find("#upload").click
end

Then(/^I should be redirected to the Upload Schedule Page$/) do
    visit "/schedules"
end

Given(/^I am on the admin page$/) do
    visit "/admin"
end

When(/^I click View Schedule$/) do
    find("#view").click
end

Then(/^I should be redirected to the View Schedule page$/) do
    visit "/view"
end