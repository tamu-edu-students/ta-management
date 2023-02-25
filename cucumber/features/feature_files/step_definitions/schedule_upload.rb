Given(/^I am on the admin home page$/) do
    visit "/admin"
  end

  When(/^I click Upload Schedule$/) do
    find("#Upload Schedule").click
  end

  Then(/^I should be redirected to the Upoad Schedule Page$/) do
    visit "/schedules"
  end

Given(/^I am on the schedule upload page$/) do
    visit "/schedules"
  end

  When(/^I click Browse... and select a non csv file"$/) do 
    find("#Browse...").click
    attach_file(:non_csv)
  end

  And(/^I click Import Schedule$/) do
    find("#Import Schedule").click
  end
    
  Then(/^I should see error "([^"]*)"$/) do |err|
    page.should have_content(err)
  end

Given(/^I am on the schedule upload page$/) do
    visit "/schedules"
  end

  When(/^I click Browse... and select a csv file"$/) do 
    find("#Browse...").click
    attach_file(:csv)
  end

  And(/^I click Import Schedule$/) do
    find("#Import Schedule").click
  end
    
  Then(/^I should be redirected back to the admin home page$/) do
    visit "/admin"
  end

  And(/^And the schedule should be uploaded to the database$/) do
    db.schedule(:csv)
  end

Given(/^I am on the admin home page$/) do
    visit "/admin"
  end

  When(/^I click View Schedule$/) do
    find("#View Schedule").click
  end
  
  And(/^a master schedule has been uploaded$/) do
    db.schedule().exists
  end

  Then(/^I should be redirected to the View Schedule page$/) do
    visit "/schedule"
  end

  And(/^the master schedule should be visible$/) do
    page.should have_content(schedule)
  end


Given(/^I am on the admin home page$/) do
      visit "/admin"
    end
    
    When(/^I click View Schedule$/) do
      find("#View Schedule").click
    end
  
    And(/^no schedule has been uploaded$/) do
      !db.schedule().exists()
    end

    Then(/^I should be redirected to the View Schedule page$/) dp
      visit "/schedule"
    end

    And(/^no schedule should be visible$/) do
      page.should have_content(headers_only)
    end



