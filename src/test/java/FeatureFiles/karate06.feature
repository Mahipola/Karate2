Feature: Feature: Karate Test Suite 04
  This feature file consists of testing REST API

  @rest
  Scenario: REST API Testing
    Given url "https://www.w3schools.com/xml/tempconvert.asmx/CelsiusToFahrenheit"
    And header Content-Type = "application/x-www-form-urlencoded"
    And request "Celsius=40"
    When method Post
    Then status 200

    And match response contains "104"
    And match response //string == "104"
    And match responseHeaders['Server'] == ['Microsoft-IIS/7.5']
    And match responseHeaders['Server'][0] == 'Microsoft-IIS/7.5'
    And match responseType == "xml"
    And assert responseTime <= 1000