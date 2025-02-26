package org.demo.stepdefs;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import static io.restassured.RestAssured.*;
import static org.hamcrest.Matchers.*;

public class ValidateApiFunctionalitySteps {

    private String apiKey;
    private String baseUrl = "http://api.example.com";
    private String userId;
    private String productId;

    @Given("the Sample API is accessible")
    public void the_sample_api_is_accessible() {
        given().when().get(baseUrl).then().statusCode(200);
    }

    @Given("I have a valid API key")
    public void i_have_a_valid_api_key() {
        apiKey = "valid_api_key";
    }

    @Given("I have an invalid API key")
    public void i_have_an_invalid_api_key() {
        apiKey = "invalid_api_key";
    }

    @Given("a user exists in the system")
    public void a_user_exists_in_the_system() {
        userId = "existing_user_id";
    }

    @Given("a product exists in the system")
    public void a_product_exists_in_the_system() {
        productId = "existing_product_id";
    }

    @When("I send a POST request to \/users endpoint with valid user data")
    public void i_send_a_post_request_to_users_endpoint_with_valid_user_data() {
        given().header("API-Key", apiKey)
               .contentType("application/json")
               .body("{ \"name\": \"John Doe\", \"email\": \"john.doe@example.com\", \"password\": \"securepassword\" }")
               .when().post(baseUrl + "/users")
               .then().statusCode(201)
               .body("name", equalTo("John Doe"));
    }

    @When("I send a GET request to \/users\/{id} endpoint with valid user ID")
    public void i_send_a_get_request_to_users_id_endpoint_with_valid_user_id() {
        given().header("API-Key", apiKey)
               .when().get(baseUrl + "/users/" + userId)
               .then().statusCode(200)
               .body("id", equalTo(userId));
    }

    @When("I send a GET request to \/users endpoint without an API key")
    public void i_send_a_get_request_to_users_endpoint_without_an_api_key() {
        when().get(baseUrl + "/users")
               .then().statusCode(401);
    }

    @When("I send a GET request to \/users endpoint with an invalid API key")
    public void i_send_a_get_request_to_users_endpoint_with_an_invalid_api_key() {
        given().header("API-Key", apiKey)
               .when().get(baseUrl + "/users")
               .then().statusCode(401);
    }

    @When("I send a POST request to \/users endpoint with invalid user data")
    public void i_send_a_post_request_to_users_endpoint_with_invalid_user_data() {
        given().header("API-Key", apiKey)
               .contentType("application/json")
               .body("{ \"name\": \"\", \"email\": \"john.doe@example.com\", \"password\": \"securepassword\" }")
               .when().post(baseUrl + "/users")
               .then().statusCode(400);
    }

    @When("I send a GET request to \/users\/{id} endpoint with a non-existent user ID")
    public void i_send_a_get_request_to_users_id_endpoint_with_a_non_existent_user_id() {
        given().header("API-Key", apiKey)
               .when().get(baseUrl + "/users/non_existent_user_id")
               .then().statusCode(404);
    }

    @When("I send a GET request to \/products endpoint")
    public void i_send_a_get_request_to_products_endpoint() {
        given().header("API-Key", apiKey)
               .when().get(baseUrl + "/products")
              