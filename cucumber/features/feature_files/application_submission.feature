Feature: TA application Submission

Scenario: Enter an invalid name
Given I have entered an invalid name
When I click submit
Then I should a prompt stating name is incorrect

Scenario: Enter a valid name
Given I have entered an valid name
When I click submit
Then I should not see any prompts

Scenario: Enter an invalid email
Given I have entered an invalid email
When I click submit
Then I should a prompt stating email is incorrect

Scenario: Enter a valid email
Given I have entered an valid email
When I click submit
Then I should not see any prompts

Scenario: Enter an invalid contact
Given I have entered an invalid contact
When I click submit
Then I should a prompt stating contact is incorrect

Scenario: Enter a valid contact
Given I have entered an valid contact
When I click submit
Then I should not see any prompts

Scenario: Do not Choose if you have a campus job
Given I have not selected if I have a campus job
When I click submit
Then I should see a prompt stating that I should select an option

Scenario: Choose if you have a campus job
Given I have selected if I have a campus job
When I click submit
Then I should not see a prompt 

Scenario: Do not Choose if you are an undergrad student
Given I have not selected if I am an undergrad student
When I click submit
Then I should see a prompt stating that I should select an option

Scenario: Choose if you are an undergrad student
Given I have selected if I am an undergrad student
When I click submit
Then I shouldn't see a prompt 

Scenario: Do not Choose what courses I have already taken
Given I have not selected any courses
When I click submit
Then I should see a prompt stating that I should select courses

Scenario: Choose what courses I have already taken
Given I have selected the courses I have taken
When I click submit
Then I should not see a prompt

Scenario: Uploaded Resume
Given I have uploaded my Resume
When I click submit
Then I should not see a prompt

Scenario: Have not Uploaded Resume
Given I have not uploaded my Resume
When I click submit
Then I should should see a prompt stating that resume is not uploaded.

Scenario: Uploaded Transcript
Given I have uploaded my Transcript
When I click submit
Then I should not see a prompt

Scenario: Have not Uploaded Transcipt
Given I have not uploaded my Transcipt
When I click submit
Then I should should see a prompt stating that Transcipt is not uploaded.



