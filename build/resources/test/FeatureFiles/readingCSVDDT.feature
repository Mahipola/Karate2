Feature: Suite 14
  Reading CSV Data DDT testing

  Scenario Outline: CSV DDT Testing
    * print "<custid>, <custname>, <age>, <yob>"
    * def json1 = {"last_name" : <custname>}
    * print json1

    Examples:
      | read('classpath:data.csv') |