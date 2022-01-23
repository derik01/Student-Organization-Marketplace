Feature: Log In
    As an organization leader or member
    So I can see my dashboard
    I want to log in to my account

Scenario: I log in  

    Given I am on the home page
    When I press the "LOG IN" link
    Then I should be on the login page
    And I should see "Log In"
    Then I log in with "anu@gmail.com" username and "12345678" password
    Then I should be on the profile page
    And I should see "You are Logged In, anu"

Scenario: I try to log in with incorrect password

    Given I am on the home page
    When I press the "LOG IN" link
    Then I should be on the login page
    And I should see "Log In"
    Then I log in with "anu@gmail.com" username and "12345" password
    And I should see "Invalid email/password combination"