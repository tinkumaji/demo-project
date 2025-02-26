Feature: Login Functionality Testing
  Verify Login Functionality with Different Username and Password Combinations

  Scenario Outline: Verify login functionality with different combinations of usernames and passwords
    Given a user navigates to the login page
    When the user enters username "<username>" and password "<password>"
    And clicks on the "Login" button
    Then the user should see "<expected_result>"

    Examples:
      | username | password  | expected_result                       |
      | user123  | Pass@123  | Login Successful                      |
      | userXYZ  | Pass@123  | Invalid username or password          |
      | user123  | WrongPass | Invalid username or password          |
      | userXYZ  | WrongPass | Invalid username or password          |
      |          |           | Username and password cannot be empty |
      |          | Pass@123  | Username and password cannot be empty |
      | user123  |           | Username and password cannot be empty |

  Scenario: Verify password field masks the entered characters
    Given a user navigates to the login page
    When the user enters username "user123" and password "Pass@123"
    Then the password field should mask the entered characters