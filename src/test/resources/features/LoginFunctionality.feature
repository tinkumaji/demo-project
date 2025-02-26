Feature: Login Functionality Testing

  Scenario Outline: Verify Login Functionality with Different Username and Password Combinations
    Given a user navigates to the login page
    When they enter the username "<Username>" and password "<Password>"
    And they click on the "Login" button
    Then they should see "<Expected Result>"

    Examples:
      | Username | Password  | Expected Result          |
      | user123  | Pass@123  | Login Successful         |
      | userXYZ  | Pass@123  | Error Message            |
      | user123  | WrongPass | Error Message            |
      | userXYZ  | WrongPass | Error Message            |
      | (empty)  | (empty)   | Error Message            |

  Scenario: Verify login failure with valid username and blank password
    Given a user navigates to the login page
    When they enter the username "user123" and leave the password field empty
    And they click on the "Login" button
    Then they should see "Username and password cannot be empty"

  Scenario: Verify login failure with blank username and valid password
    Given a user navigates to the login page
    When they leave the username field empty and enter the password "Pass@123"
    And they click on the "Login" button
    Then they should see "Username and password cannot be empty"

  Scenario: Verify password field masks the entered characters
    Given a user navigates to the login page
    When they enter the username "user123" and password "Pass@123"
    Then the password field should mask the entered characters

  Scenario: Verify login failure after multiple unsuccessful attempts
    Given a user navigates to the login page
    When they enter invalid credentials multiple times
    Then they should see an error message indicating account lock or rate limiting