Feature: TA application Submission
  Scenario: Name is blank in TA application
    Given I am on the TA application page
    When I submit application with empty name
    Then I should see error "Name can't be blank"

  Scenario: Email id is blank in TA application
    Given I am on the TA application page
    When I submit application with empty email id
    Then I should see error "Email can't be blank"

  Scenario: UIN is blank in TA application
    Given I am on the TA application page
    When I submit application with empty uin
    Then I should see error "Uin can't be blank"