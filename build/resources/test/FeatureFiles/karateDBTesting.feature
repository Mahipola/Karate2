Feature: Karate DB Testing suite
  Interacting withDB

  Background: DB Init
    * def db = Java.type('misc.MyDbUtil')

  Scenario: Select Statement TC
    * def rows = db.selectStatement("select * from tools")
    * print rows
    * match rows contains "Karate"

  Scenario: Incert Statement TC
    * def res = db.insertStatement("Insert into tools values(87,'Selenium','ttt')")
    * print res
    * match res == "Success"

  Scenario: Update Statement TC
    * def rowsAffected = db.updateStatement("update tools set toolName='WebDriver' where toolID=87")
    * print rowsAffected
    * assert rowsAffected >= 1

  Scenario: Delete Statement TC
    * def rowsAffected = db.deleteStatement("delete from tools where toolID=87")
    * print rowsAffected
    * assert rowsAffected >= 1
