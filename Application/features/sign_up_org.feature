Feature: sign up as an organization
    As an organization leader
    So I can sell products
    I want to create an account

Scenario: I sign up as an organization  

    Given I am on the home page
    When I press the "SIGN UP" link
    Then I should be on the sign up page
    And I should see "I am trying to sign up as a ..."
    When I select checkbox "reg-log"
    And I should see "Organization"
    When I will sign up with "Aggie Outdoors" organization name, "outdoors@gmail.com" username, and "Howdy123" password
    Then I should be on the profile page
    And I should see "You are Logged In, Aggie Outdoors"