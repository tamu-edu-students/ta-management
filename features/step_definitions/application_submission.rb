Given(/^I am on the TA application page$/) do
    visit "/students/new"
  end
  
  When(/^I submit application with empty name$/) do
    find("#form_submit").click
  end
  
  Then(/^I should see error "([^"]*)"$/) do |arg|
    page.should have_content(arg)
  end

  When(/^I submit application with empty email id$/) do
    find("#form_submit").click
  end

  When(/^I submit application with empty uin$/) do
    find("#form_submit").click
  end
