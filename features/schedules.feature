Feature: Schedule page
    Scenario: Schedule can be removed
        Given I am on the view page
        When I click on remove all schedules button
        Then All schedules will be removed

    Scenario: Navigate to Schedule Upload Page
        Given I am on the admin home page
        When I click Upload Schedule
        Then I should be redirected to the Upload Schedule Page

    Scenario: View Uploaded Schedule
        Given I am on the admin page
        When I click View Schedule
        Then I should be redirected to the View Schedule page