Feature: Upload a master schedule
    Scenario: Navigate to Schedule Upload Page
	Given I am on the admin home page
	When I click Upload Schedule
	Then I should be redirected to the Upload Schedule Page    

    Scenario: Invalid Filetype
	Given I am on the schedule upload page
	When I click Browse... and select a non csv file
	And I click Import Schedule
	Then I should see error "Only CSV file please"

    Scenario: Successful Upload
	Given I am on the schedule upload page
	When I click Browse... and select a csv file
	And I click Import Schedule
	Then I should be redirected back to the admin home page
	And the schedule should be uploaded to the database

    Scenario: View Uploaded Schedule
	Given I am on the admin home page
	When I click View Schedule
	And a master schedule has been uploaded
	Then I should be redirected to the View Schedule page
	And the master schedule should be visible

    Scenario: View Blank Schedule
	Given I am on the admin home page
	When I click View Schedule
	And no schedule has been uploaded
	Then I should be redirected to the View Schedule page
	And no schedule should be visable

