Feature: Feature: Karate Test Suite 10
  Using URL andPath

  Scenario: URL and path test case 1
    Given url "https://reqres.in"
    And path "/api/users?page=2"
    When method get
    Then status 200
    And match response.page == "##"

  Scenario: URL and path test case 2
    Given url "https://reqres.in"
    And path "/api/users"
    And param page = 2
    When method get
    Then status 200
    And match response.page == '##'