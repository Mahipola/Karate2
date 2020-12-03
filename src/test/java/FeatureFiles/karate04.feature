Feature: Feature: Karate Test Suite 04
  This feature file consists of testing SOAP API

  @soap
  Scenario: SOAP API Testing
    Given url "https://www.w3schools.com/xml/tempconvert.asmx"
    And header Content-Type = "text/xml; charset=utf-8"
    And request
    """
      <?xml version="1.0" encoding="utf-8"?>
  <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
    <soap:Body>
      <CelsiusToFahrenheit xmlns="https://www.w3schools.com/xml/">
        <Celsius>37</Celsius>
      </CelsiusToFahrenheit>
    </soap:Body>
  </soap:Envelope>
    """
    When soap action "https://www.w3schools.com/xml/CelsiusToFahrenheit"
    Then status 200
    And match response contains "98.6"
    And match response //CelsiusToFahrenheitResponse/CelsiusToFahrenheitResult == "98.6"
    And match responseHeaders['Server'] == ['Microsoft-IIS/7.5']
    And match responseHeaders['Server'][0] == 'Microsoft-IIS/7.5'
    And match responseType == "xml"
    And assert responseTime <= 1000