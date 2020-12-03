Feature: Feature: Karate Test Suite 07
  This feature file consists of testing SOAP API with external payload file

  @soap
  Scenario: SOAP API Testing
    Given url "https://www.w3schools.com/xml/tempconvert.asmx"
    And header Content-Type = "text/xml; charset=utf-8"
    #And request read("soapAPIPayloadData.xml")
    And request read("../PayloadData/soapAPIPayloadData.xml")
    When soap action "https://www.w3schools.com/xml/CelsiusToFahrenheit"
    Then status 200
    And match response contains "122"
    And match response //CelsiusToFahrenheitResponse/CelsiusToFahrenheitResult == "122"
    And match responseHeaders['Server'] == ['Microsoft-IIS/7.5']
    And match responseHeaders['Server'][0] == 'Microsoft-IIS/7.5'
    And match responseType == "xml"
    And assert responseTime <= 1000