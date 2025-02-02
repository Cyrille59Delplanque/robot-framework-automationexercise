*** Settings ***
Library    SeleniumLibrary

Resource    ../resources/keywords.robot

Name    Example_Test_Sauce_Demo
Test Teardown    SeleniumLibrary.Close Browser

*** Test Cases ***
Scenario : Simple Search
    Given I am on automationexercise website
    When On Page Products a User search Dress in search bar
    Then All products display contains Dress

Scenario : Address Check
    [Teardown]    Teardown Delete RobertLucien account
    Given I am on automationexercise website
    When RobertLucien create account
    And Proceed to pay 2 ordered Products
    Then Delivery Address of RobertLucien is confirmed

