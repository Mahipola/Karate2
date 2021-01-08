Feature: JMS REST API - Test Suite 2
  interacting with JMS - ActiveMQ Server - with inline credentials
  without using Authorization
  # syntax:  http://admin:admin@192.168.1.92:8161/api/jolokia


  Background: Init
    Given url "http://admin:admin@192.168.1.92:8161"


  Scenario: Getting ActiveMQ Server Status with inline credentials
    Given path "/api/jolokia"
    When method get
    Then status 200
    * print responseType
    * assert responseType == "json"
    * match response.value.agent == "1.3.4"
    * match response.value.info.product == "activemq"

    