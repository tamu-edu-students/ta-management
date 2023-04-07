Given(/^I am on the view page$/) do
    visit "/view"
end
  
When(/^I click on remove all schedules button$/) do 
    find("#remove").click
end
  
Then(/^All schedules will be removed$/) do
    visit "/view"
end