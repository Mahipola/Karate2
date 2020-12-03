Feature: Karate Test Suite 11
  Data driven testing

  @ddt
  Scenario Outline: DDT Test Case 01
    Given url "https://reqres.in"
    And path "/api/users?page=<pno>"
    When method get
    Then status 200
    And match response.page == "##"

    Examples:
    | pno |
    | 1  |
    | 2  |
    | 3  |
    | 4  |
    | 5  |

