Feature: Suite 15
  Reading CSV Data DDT testing

  Background:
    * def data = read('classpath:data.csv')

  Scenario Outline: CSV DDT Testing
    * print "<custid>, <custname>, <age>, <yob>"
    * def json1 = {"last_name" : <custname>}
    * print json1

    Examples:
      | data |