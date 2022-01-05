Feature: sign up as an organization
    As an organization leader
    So I can sell products
    I want to create an account

Scenario: I sign up as an organization  

    Given I am on the home page
    When I press "SIGN UP"
    Then I should be on the sign up page
    And I should see "Create an Account"
    Then I sign up with "anukhatri@tamu.edu" username and "Howdy123" password
    Then I should be on the welcome page