Feature: Sign up a new user
  Scenario: Name is blank in form
    Given I am on the sign up page
    When I submit form with empty name
    Then I should see error stating "Name can't be blank"

  Scenario: Password is blank in form
    Given I am on the sign up page
    When I submit form with empty password
    Then I should see error stating "Password can't be blank"

  Scenario: Email id is blank in form
    Given I am on the sign up page
    When I submit form with empty email id
    Then I should see error stating "Email can't be blank"

  Scenario: Password and Confirm Password do not match
    Given I am on the sign up page
    When I fill in "password" with "XYZ"
    And I fill in "confirm_password" with "XYZ123"
    And I submit form
    Then I should see error stating "Password and confirm password do not match"