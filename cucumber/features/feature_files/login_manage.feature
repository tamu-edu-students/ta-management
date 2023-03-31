Feature: Login as Admin and Manage user accounts
    Scenario: Navigate to Login page
	Given I am on the home page
	When I click Login
	Then I should be redirected to the Login Page

    Scenario: Login as Admin
    Given I am on the login page
    When I enter my username and password
    Then I click login
    Then I should be redirected to the admin page.

    Scenario: Manage the user accounts
    Given I am on the admin page
    When I click view all user button
    Then I should be redirected to users page
    Then I click delete button for one user account that no longer needed
    Then I click Ok
    And I will Successfully delete that user account


