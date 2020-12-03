Feature: Karate Test Suite 11
  Demo of javascript functions within scenario

  Scenario: Javascript function TC1
    * def fn1 = function(){ return 123; }

    * def fn2 =
    """
    function(id)
    {
      karate.log(id);
    }
    """
    * print fn1()
    * fn2("Mahi")