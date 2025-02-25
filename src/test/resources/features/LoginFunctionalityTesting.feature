Feature: Login Functionality Testing

  Scenario: Verify successful login with valid credentials
    Given User "user123" is registered in the system
    And Login page is accessible
    When User navigates to the login page
    And User enters username "user123"
    And User enters password "Pass@123"
    And User clicks on the "Login" button
    Then User is successfully logged in
    And User is redirected to the dashboard

  Scenario: Verify login failure with invalid username and valid password
    Given Login page is accessible
    When User navigates to the login page
    And User enters username "userXYZ"
    And User enters password "Pass@123"
    And User clicks on the "Login" button
    Then Login fails
    And Error message "Invalid username or password" is displayed

  Scenario: Verify login failure with valid username and invalid password
    Given User "user123" is registered in the system
    And Login page is accessible
    When User navigates to the login page
    And User enters username "user123"
    And User enters password "WrongPass"
    And User clicks on the "Login" button
    Then Login fails
    And Error message "Invalid username or password" is displayed

  Scenario: Verify login failure with invalid username and invalid password
    Given Login page is accessible
    When User navigates to the login page
    And User enters username "userXYZ"
    And User enters password "WrongPass"
    And User clicks on the "Login" button
    Then Login fails
    And Error message "Invalid username or password" is displayed

  Scenario: Verify login failure with blank username and password
    Given Login page is accessible
    When User navigates to the login page
    And User leaves username field empty
    And User leaves password field empty
    And User clicks on the "Login" button
    Then Login fails
    And Error message "Username and password cannot be empty" is displayed

  Scenario: Verify login failure with blank username and valid password
    Given Login page is accessible
    When User navigates to the login page
    And User leaves username field empty
    And User enters password "Pass@123"
    And User clicks on the "Login" button
    Then Login fails
    And Error message "Username and password cannot be empty" is displayed

  Scenario: Verify login failure with valid username and blank password
    Given User "user123" is registered in the system
    And Login page is accessible
    When User navigates to the login page
    And User enters username "user123"
    And User leaves password field empty
    And User clicks on the "Login" button
    Then Login fails
    And Error message "Username and password cannot be empty" is displayed

  Scenario: Verify login with case-sensitive username
    Given User "user123" is registered in the system
    And Login page is accessible
    When User navigates to the login page
    And User enters username "USER123"
    And User enters password "Pass@123"
    And User clicks on the "Login" button
    Then Login fails
    And Error message "Invalid username or password" is displayed

  Scenario: Verify login with case-sensitive password
    Given User "user123" is registered in the system
    And Login page is accessible
    When User navigates to the login page
    And User enters username "user123"
    And User enters password "pass@123"
    And User clicks on the "Login" button
    Then Login fails
    And Error message "Invalid username or password" is displayed

  Scenario: Verify login failure after multiple unsuccessful attempts (rate limiting)
    Given Login page is accessible
    And Rate limiting is implemented
    When User navigates to the login page
    And User enters invalid credentials
    And User clicks on the "Login" button
    And User repeats steps 2-3 multiple times
    Then Login fails
    And Error message "Too many unsuccessful attempts. Please try again later." is displayed