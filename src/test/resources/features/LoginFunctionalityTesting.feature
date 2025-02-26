Feature: Login Functionality Testing
  Verify Login Functionality with Different Username and Password Combinations

  Scenario Outline: Verify login functionality with different combinations of usernames and passwords
    Given a user navigates to the login page
    When the user enters username "<Username>" and password "<Password>"
    And clicks on the "Login" button
    Then the user should see "<Expected Result>"

    Examples:
      | Username | Password  | Expected Result                |
      | user123  | Pass@123  | Login Successful               |
      | userXYZ  | Pass@123  | Invalid username or password   |
      | user123  | WrongPass | Invalid username or password   |
      | userXYZ  | WrongPass | Invalid username or password   |
      |          |           | Username and password cannot be empty |

  Scenario: Verify password field masking
    Given a user navigates to the login page
    When the user enters username "user123" and password "Pass@123"
    Then the password field should display masked characters

  Scenario: Verify case sensitivity of username
    Given a user is registered with username "user123"
    When the user enters username in uppercase "USER123" and password "Pass@123"
    Then the user should see "Invalid username or password"
