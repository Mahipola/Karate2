Feature: Karate config suite file
  Reading the global variable from karate-config js file

  Scenario: Reading global variable TC1
    Given url baseUrl
    And path listUsers
    And method get
    Then status 200