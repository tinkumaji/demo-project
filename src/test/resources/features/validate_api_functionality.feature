Feature: Validate API Functionality for User and Product Management
  As a QA Tester, I want to validate the functionality of the Sample API so that I can ensure it meets business requirements and provides the expected responses.

  Background:
    Given the Sample API is accessible

  Scenario Outline: Create a new user with valid input
    Given I have a valid API key
    When I send a POST request to /users endpoint with valid user data
    Then the response status code should be 201
    And the response body should contain the created user details

    Examples:
      | name     | email                 | password       |
      | John Doe | john.doe@example.com  | securepassword |

  Scenario: Retrieve user details with valid ID
    Given I have a valid API key
    And a user exists in the system
    When I send a GET request to /users/{id} endpoint with valid user ID
    Then the response status code should be 200
    And the response body should contain the correct user details

  Scenario: Attempt to access API without API key
    When I send a GET request to /users endpoint without an API key
    Then the response status code should be 401

  Scenario: Attempt to access API with invalid API key
    Given I have an invalid API key
    When I send a GET request to /users endpoint with an invalid API key
    Then the response status code should be 401

  Scenario Outline: Create a new user with invalid input
    Given I have a valid API key
    When I send a POST request to /users endpoint with invalid user data
    Then the response status code should be 400

    Examples:
      | name     | email                | password       |
      |          | john.doe@example.com | securepassword |
      | John Doe |                     | securepassword |

  Scenario: Retrieve non-existent user
    Given I have a valid API key
    When I send a GET request to /users/{id} endpoint with a non-existent user ID
    Then the response status code should be 404

  Scenario: Retrieve list of available products
    Given I have a valid API key
    When I send a GET request to /products endpoint
    Then the response status code should be 200
    And the response body should contain a list of available products

  Scenario: Retrieve product details with valid ID
    Given I have a valid API key
    And a product exists in the system
    When I send a GET request to /products/{id} endpoint with valid product ID
    Then the response status code should be 200
    And the response body should contain the correct product details

  Scenario: Retrieve non-existent product
    Given I have a valid API key
    When I send a GET request to /products/{id} endpoint with a non-existent product ID
    Then the response status code should be 404

  Scenario: Exceed rate limit
    Given I have a valid API key
    When I send more than 1000 API requests within one hour using the same API key
    Then the response status code should be 429

  Scenario: Validate error messages for various scenarios
    Given I have valid and invalid API keys
    And valid and invalid data
    When I send requests that trigger different error scenarios
    Then the response should contain appropriate HTTP status codes
    And the response body should include meaningful error messages

  Scenario: Update existing user with valid input
    Given I have a valid API key
    And a user exists in the system
    When I send a PUT request to /users/{id} endpoint with valid user ID and updated data
    Then the response status code should be 200
    And the response body should contain the updated user details

  Scenario: Delete existing user
    Given I have a valid API key
    And a user exists in the system
    When I send a DELETE request to /users/{id} endpoint with valid user ID
    Then the response status code should be 204

  Scenario: Attempt to update non-existent user
    Given I have a valid API key
    When I send a PUT request to /users/{id} endpoint with a non-existent user ID and updated data
    Then the response status code should be 404