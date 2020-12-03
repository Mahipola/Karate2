Feature: This is my First Feature
  This is karate feature file

  Background: This is setup block
    Given This is given precondition step1
    And This is given precondition step2

  @TagName
  Scenario: First Karate Test Case

    Given This is precondition Step1
    And This is precondition Step2
    When This is action Step1
    And This is action Step2
    Then This is validation Step1
    And This is validation Step2