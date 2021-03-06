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
    Then I should not see "Sorry your passwords did not match!"
    When I press "Register"
    Then I should see "Welcome, citizen1!"
    And I should be on the homepage

  @javascript
  Scenario: User cannot signup with mismatching passwords
    Given I am on user signup page
    When I fill in form with mismatching passwords
    Then I should see "Passwords Don't Match"
    And I press "Register"
    Then I should see "Sorry your passwords did not match!"
    And I should not see "Welcome, citizen1!"
    And I should be on user signup page

  @javascript
  Scenario: Mismatching passwords warning disappears
    Given I am on user signup page
    When I fill in form with mismatching passwords
    Then I should see "Passwords Don't Match"
    When I fill in "password_confirmation" with "ra88it"
    Then I should not see "Passwords Don't Match"

  @javascript
  Scenario: User cannot signup with password shorter than 6 chars
    Given I am on user signup page
    When I fill in form with short password
    Then I should see "Password Too SHORT"
    And I press "Register"
    Then I should see "Sorry, your password was too short"
    And I should not see "Welcome, citizen1!"
    And I should be on user signup page

  @javascript
  Scenario: Short password warning disappears with correct length
    Given I am on user signup page
    When I fill in form with short password
    Then I should see "Password Too SHORT"
    When I fill in "password" with "ra88bit"
    Then I should not see "Password Too SHORT"

  Scenario: User cannot signup with an existing username
    Given I sign up
    And I press "Sign out"
    When I sign up
    Then I should see "Sorry, This username already exists!"

  Scenario: User cannot signup with an existing email
    Given I sign up
    And I press "Sign out"
    When I sign up with the same email
    Then I should see "Sorry, A user with this email already exists!"

  Scenario: User cannot signup with an existing email and username
    Given I sign up
    And I press "Sign out"
    When I sign up
    Then I should see "Sorry, A user with this email already exists!"
    And I should see "Sorry, This username already exists!"
