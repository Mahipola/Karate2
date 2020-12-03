Feature: Called Test Suite

  Scenario: URL and path test case 1
    Given url "https://reqres.in"
    And path "/api/users?page=2"
    When method get
    Then status 200
    And match response.page == "##"
