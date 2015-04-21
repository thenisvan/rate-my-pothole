Feature: A user can sign up
  In order to have a profile
  As a user
  I would like to sign up

  Scenario: Can sign up
    Given I am on the homepage
    When I press "Sign up"
    And I fill in "username" with "citizen1"
    And I fill in "email" with "angry@citizen.com"
    And I fill in "password" with "ra88it"
    And I fill in "password_confirmation" with "ra88it"
    And I press "Register"
    Then I should see "Welcome, citizen1!"
    And I should be on the homepage

  Scenario: User cannot signup with mismatching passwords
    Given I am on user signup page
    And I fill in "username" with "citizen1"
    And I fill in "email" with "angry@citizen.com"
    And I fill in "password" with "ra88it"
    And I fill in "password_confirmation" with "fox!"
    And I press "Register"
    Then I should see "Sorry your passwords did not match!"
    And I should not see "Welcome, citizen1!"
    And I should be on user signup page

  Scenario: User cannot signup when password is not supplied
    Given I am on user signup page
    And I fill in "username" with "citizen1"
    And I fill in "email" with "angry@citizen.com"
    And I fill in "password_confirmation" with "ra88it"
    And I press "Register"
    Then I should see "Sorry, there was something wrong with your password!"
    And I should not see "Welcome, citizen1!"
    And I should be on user signup page
