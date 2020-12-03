Feature: Feature: Karate Test Suite 09
  REST API end to end testing

  Scenario: Create Fetch update delete employee test
    Given url "http://dummy.restapiexample.com/api/v1/create"
    And request {"name":"Mahender","salary":"12345","age":"33"}
    When method POST
    Then status 200
    * def id = response.data.id
    * print id
    * match response.data.name == "Mahender"
    Given url "http://dummy.restapiexample.com/api/v1/employee/" + id
    When method GET
    Then status 200

    Given url "http://dummy.restapiexample.com/api/v1/update/" + id
    And request {"name":"Mahender","salary":"12345","age":"34"}
    When method PUT
    Then status 200

    Given url "http://dummy.restapiexample.com/api/v1/delete/" + id
    When method DELETE
    Then status 200

    Given url "http://dummy.restapiexample.com/api/v1/employee/" + id
    When method GET
    Then status 200






