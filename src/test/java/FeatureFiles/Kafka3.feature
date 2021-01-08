Feature: Kafka Test Suite3
  Using Kafka Rest Proxy - Consuming Topic

  Background: Init
    Given url "http://192.168.1.94:8082"

  Scenario: Creating Consumer
    # my-consumer-group chnaged to sneha-consumer-group
    Given path "/consumers/sneha-consumer-group"
    And request
    """
    {
       "name" : "sneha_consumer3",
       "format" : "json",
       "auto.offset.reset" : "earliest",
       "auto.commit.enable" : "false"
    }
    """
    And header Content-Type = "application/vnd.kafka.json.v2+json"
    When method post
    Then status 200
    * print response
    * match response.instance_id == "sneha_consumer3"
    * def consumer_url = response.base_uri

    * print consumer_url


    Scenario: Subscribing to topic
      Given path "/consumers/sneha-consumer-group/instances/sneha_consumer3/subscription"
      And request
      """
      {
        "topics" : [ "topic3_sneha" ]
      }
      """
      And header Content-Type = "application/vnd.kafka.v2+json"
      When method post
      Then status 204



  Scenario: Getting Subscription
    Given path "/consumers/sneha-consumer-group/instances/sneha_consumer3/subscription"
    And header Accept = "application/vnd.kafka.v2+json"
    When method get
    Then status 200
    * print response
    * assert response.topics[0] == "topic3_sneha"


  Scenario: Getting Subscription records
    Given path "/consumers/sneha-consumer-group/instances/sneha_consumer3/records"
    And param timeout = 3000
    And param max_bytes = 300000
    And header Accept = "application/vnd.kafka.json.v2+json"
    When method get
    Then status 200
    * print response


  Scenario: Getting assigned Assignments
    Given path "/consumers/sneha-consumer-group/instances/sneha_consumer3/assignments"
    And header Accept = "application/vnd.kafka.v2+json"
    When method get
    Then status 200
    * print response
    * assert response.partitions[0].topic == "topic3_sneha"



  Scenario: Deleting assigned subscription
    Given path "/consumers/sneha-consumer-group/instances/sneha_consumer3/subscription"
    And header Accept = "application/vnd.kafka.v2+json"
    When method delete
    Then status 204


  Scenario: Deleting consumer
    Given path "/consumers/sneha-consumer-group/instances/sneha_consumer3"
    And header Accept = "application/vnd.kafka.v2+json"
    When method delete
    Then status 204

  Scenario: Deleting consumer - Negative Test Case
    Given path "/consumers/sneha-consumer-group/instances/sneha_consumer3"
    And header Accept = "application/vnd.kafka.v2+json"
    When method delete
    Then status 404
    * assert response.message == "Consumer instance not found."