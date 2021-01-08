Feature: Kafka Test Suite4
  Using Kafka Rest Proxy - Clusters

  Background: Init
    Given url "http://192.168.1.94:8082"

  Scenario: Getting all Kakfa Clusters
    Given path "/v3/clusters"
    When method get
    Then status 200
    * assert response.kind == "KafkaClusterList"
    * def cluster_url = response.data[0].metadata.self
    * print cluster_url

    Given url cluster_url
    When method get
    Then status 200
    * assert response.kind == "KafkaCluster"
    * assert response.metadata.self == cluster_url

