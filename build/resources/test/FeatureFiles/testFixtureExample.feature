Feature: Test Fixture suite
  UsingBackground Before and After Scenario

  Background: Before Scenario
    * print "Before Scenario"
    #* configure afterScenario =
   # """
   # function()
   # {
   # karate.log("From after scenario");
   # }
  #  """
    * configure afterFeature =
    """
    function()
    {
    karate.log("From after feature");
    }
    """

    Scenario: TC1
      * print "From TC1"

    Scenario: TC2
      * print "From TC2"
