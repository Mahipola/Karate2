Feature: Calling Test Suite

  Scenario: Calling Test case
    * def result = call read('calledFeature.feature')
    * print result
    * match result.responseType == "json"
    * match result.responseHeaders.Transfer-Encoding[0] == "chunked"
    * match result.response.data[0].name == "cerulean"
