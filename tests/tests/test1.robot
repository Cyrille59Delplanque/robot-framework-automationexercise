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

# Cliquez sur le bouton « Inscription/Connexion »
# Remplissez tous les détails dans l'inscription et créez un compte
# Vérifiez « COMPTE CRÉÉ ! » et cliquez sur le bouton « Continuer »
# Vérifiez « Connecté avec le nom d'utilisateur » en haut
# Ajouter des produits au panier
# Cliquez sur le bouton « Panier »
# Vérifiez que la page du panier s'affiche
# Cliquez sur « Procéder au paiement »
# Vérifiez que l'adresse de livraison et l'adresse de facturation sont les mêmes que celles renseignées lors de l'enregistrement du compte
# Cliquez sur le bouton « Supprimer le compte »
# Vérifiez « COMPTE SUPPRIMÉ ! » et cliquez sur le bouton « Continuer »


