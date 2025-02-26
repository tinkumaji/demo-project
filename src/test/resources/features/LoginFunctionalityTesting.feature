Feature: Login Functionality Testing

  Scenario Outline: Verify Login Functionality with Different Username and Password Combinations
    Given a user navigates to the login page
    When the user enters username "<Username>" and password "<Password>"
    And clicks on the "Login" button
    Then the user should see "<Expected Result>"

    Examples:
      | Username | Password  | Expected Result          |
      | user123  | Pass@123  | Login Successful         |
      | userXYZ  | Pass@123  | Invalid username or password |
      | user123  | WrongPass | Invalid username or password |
      | userXYZ  | WrongPass | Invalid username or password |
      |          |           | Username and password cannot be empty |
