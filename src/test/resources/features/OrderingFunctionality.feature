Feature: Ordering Functionality Testing

  Scenario Outline: Verify successful product selection and viewing details
    Given a customer is browsing the product catalog
    When they select a product
    Then they should be able to view detailed product information, including price, description, and availability

  Examples:
    | Product     |
    | Smartphone  |

  Scenario Outline: Verify adding a product to the cart
    Given a customer has selected a product
    When they click on "Add to Cart"
    Then the product should be successfully added to their shopping cart

  Examples:
    | Product     | Quantity |
    | Smartphone  | 1        |

  Scenario Outline: Verify viewing the cart with multiple products
    Given a customer has added products to their cart
    When they navigate to the cart page
    Then they should see a list of added products with their details, total price, and an option to proceed to checkout

  Examples:
    | Products            | Quantities |
    | Smartphone, Headphones | 1, 2      |

  Scenario: Verify proceeding to checkout from the cart page
    Given a customer is on the cart page with products added
    When they click on "Proceed to Checkout"
    Then they should be redirected to the checkout page to enter shipping and payment details

  Scenario Outline: Verify entering valid shipping details
    Given a customer is on the checkout page
    When they enter valid shipping information
    Then the system should validate the information and allow them to proceed to payment

  Examples:
    | Shipping Details |
    | Name, Address, City, ZIP, Country |

  Scenario Outline: Verify successful order placement with valid payment
    Given a customer has entered valid shipping details
    When they enter valid payment details and submit the order
    Then the system should process the payment and confirm the order

  Examples:
    | Payment Method | Card Details |
    | Credit Card    | Valid        |

  Scenario: Verify order confirmation and email receipt
    Given a successful payment
    When the order is processed
    Then the customer should receive an order confirmation page and email with order details

  Scenario Outline: Verify order tracking functionality
    Given an order has been placed successfully
    When the customer navigates to the order history page
    Then they should be able to track the status of their order

  Examples:
    | Order ID |
    | Valid order number |

  Scenario Outline: Verify error handling for invalid payment information
    Given a customer has entered valid shipping details
    When they enter invalid payment details and submit the order
    Then the system should reject the payment and display an error message

  Examples:
    | Payment Method       | Card Details    |
    | Expired Credit Card  | Expired         |

  Scenario Outline: Verify error handling for missing shipping details
    Given a customer is on the checkout page
    When they enter incomplete shipping information
    Then the system should detect the missing information and display an error message

  Examples:
    | Shipping Details |
    | Incomplete (missing address) |

  Scenario: Verify error handling for empty cart checkout
    Given a customer is logged in with an empty cart
    When they attempt to proceed to checkout
    Then the system should display an error message indicating the cart is empty

  Scenario Outline: Verify product availability check before purchase
    Given a customer is on the product page of an out-of-stock item
    When they attempt to add the product to cart
    Then the system should display an "Out of Stock" message and disable the "Add to Cart" button

  Examples:
    | Product            |
    | Out of stock item  |

  Scenario Outline: Verify real-time order status updates
    Given an order has been placed successfully
    When the customer navigates to the order tracking page
    Then they should be able to see the current status of their order

  Examples:
    | Order ID |
    | Valid order number |