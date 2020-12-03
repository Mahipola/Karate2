Feature: Karate Test suite 01
  Demo of using varaibles in scenario

  Scenario: Karate Test Case 01
    Given def a = 10
    And def b = 20
    When def c = a + b
    Then assert c == 30
    And print "c=", c
    And karate.log("Test Ended")

  Scenario: Karate Test Case 02
    Given def a = 50
    * def b = 20
    When def c = a + b
    Then assert c == 70
    * print "c=", c
    * karate.log("Test Ended")

  Scenario: Karate Test Case 03
    * def a = 50
    * def b = 50
    * def c = a + b
    * assert c == 100
    * print "c=", c
    * karate.log("Test Ended")