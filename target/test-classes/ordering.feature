Feature: Ordering drinks

  User story :
  As Romeo,
  I want to create an empty order for Juliet
  so that I can add drinks later.

  As Romeo,
  I want to add a drink into an order
  so that I can drink it.

  As Romeo,
  I want to pay for an order
  so that I'm not going to jail.

  @ordering
  Scenario: Creating an empty order
    Given Romeo who wants to create an Order
    When Juliet is declared as recipient
    Then the order does not contain any drinks

  @ordering
  Scenario: Adding a drink to an order
    Given Tom who wants to create an Order
    When Jerry is declared as recipient
    And a "PepsaCola Zero" is added to the order
    Then the order contains 1 drink

  @ordering
  Scenario: Checking the contents of an order
    Given Seb who wants to create an Order
    When Jean-Michel is declared as recipient
    And a "PepsaCoke Zero" is added to the order
    And a "DietCola Max" is added to the order
    And another "PepsaCoke Zero" is added to the order
    Then the order contains 3 drinks
    And the order contains 2 "PepsaCoke Zero"
    And the order contains 1 "DietCola Max"

  @payment
  Scenario: Paying the price
    Given Céline who wants to create an Order
    And the price of a "PepsaCoke Zero" being 2.75 dollars
    And the price of a "DietCola Max" being 2.55 dollars
    And taxes in Quebec being 15%
    When René is declared as recipient
    And a "PepsaCoke Zero" is added to the order
    And a "DietCola Max" is added to the order
    Then the price without taxes is 5.30 dollars
    And the price including taxes is 6.10 dollars