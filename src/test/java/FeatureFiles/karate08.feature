Feature: Feature: Karate Test Suite 08
  REST API testing with JSON

  @rest
  Scenario: REST API Testing
    Given url "http://dummy.restapiexample.com/api/v1/employees"
    When method get
    Then status 200
    And match responseType == "json"
    And assert responseTime <= 1000
    * match response.status == "success"
    * match response.status == "#string"
    * match response.data == "#array"
    * print response.data[0].employee_name
    * match response.data[0].employee_name == "Tiger Nixon"