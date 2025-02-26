Feature: Login Functionality Testing

  Scenario Outline: Verify login functionality with different combinations of usernames and passwords
    Given a user is on the login page
    When the user enters username "<Username>" and password "<Password>"
    And clicks the "Login" button
    Then the user should see "<Expected Result>"

    Examples:
      | Username | Password  | Expected Result                       |
      | user123  | Pass@123  | Login Successful                      |
      | userXYZ  | Pass@123  | Invalid username or password          |
      | user123  | WrongPass | Invalid username or password          |
      | userXYZ  | WrongPass | Invalid username or password          |
      |          |           | Username and password cannot be empty |

  Scenario: Verify password field masks the entered characters
    Given a user is on the login page
    When the user enters username "user123" and password "Pass@123"
    Then the username should be visible as plain text
    And the password field should show masked characters

  Scenario: Verify login with case-sensitive username
    Given a user is on the login page
    When the user enters username "USER123" and password "Pass@123"
    And clicks the "Login" button
    Then the user should see "Invalid username or password"

  Scenario: Verify login with case-sensitive password
    Given a user is on the login page
    When the user enters username "user123" and password "pass@123"
    And clicks the "Login" button
    Then the user should see "Invalid username or password"

  Scenario: Verify login failure after multiple unsuccessful attempts
    Given a user is on the login page
    When the user enters invalid credentials multiple times
    Then the user should see a rate limiting or captcha message