Feature: Karate Test Suite 13
  Calling static and non static variables

  Scenario: Static variable TC
    * def constants = Java.type('misc.automationConstants')
    * print constants.devURL
    * print constants.getDevUrl()

  Scenario: Non Static variable TC
    * def env1 =
    """
    function()
    {
      var tmp = Java.type('misc.automationConstants');
      var constants = new tmp();
      return constants.qaURL;
    }
    """
    * def qaUrl = call env1
    * print qaUrl
    * print env1()

  Scenario: Non Static variable TC
    * def env1 =
    """
    function()
    {


      return (new(Java.type('misc.automationConstants'))).qaURL
    }
    """
    * def qaUrl = call env1
    * print qaUrl
    * print env1()