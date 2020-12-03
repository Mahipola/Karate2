Feature: Karate Test Suite 03
  This feature file consists of how to validate xml content

  Scenario: XML Test Case 01
    Given def xml =   <info><id>101</id><tool><name>Karate</name><version>0.9.6</version></tool></info>
    Then print xml
    * match xml/info/id == 101
    * match xml.info.id == "101"
    * match xml/info/tool contains "<name>Karate</name><version>0.9.6</version>"
    * match xml contains "<name>Karate</name><version>0.9.6</version>"

  Scenario: XML Test Case 02
    Given def xml =
    """
    <info>
        <id>101</id>
        <tool>
            <name>Karate</name>
            <version>0.9.6</version>
        </tool>
         <tool>
            <name>IntelliJ</name>
            <version>2020.2</version>
        </tool>
    </info>
    """
    Then print xml
    * match xml/info/id == 101
    * match xml.info.id == "101"
    * match xml/info/tool[1] contains "<name>Karate</name><version>0.9.6</version>"
    * match xml/info/tool[2] contains "<name>IntelliJ</name><version>2020.2</version>"
    * match xml.info.tool[*].name == "Karate"