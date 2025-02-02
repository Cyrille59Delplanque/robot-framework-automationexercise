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

Scenario : Control Download Invoice
    [Teardown]    Teardown Delete RobertLucien account
    Given I am on automationexercise website
    When Proceed to pay 2 ordered Products while creating RobertLucien account
    And Download Invoice invoice.txt
    Then Invoice invoice.txt is Downloaded 




# @Télécharger la facture après le bon de commande
# 1. Lancez le navigateur
# 2. Naviguez jusqu’à l’URL 'http://automationexercise.com'
# 3. Vérifiez que la page d’accueil est visible avec succès
# 4. Ajouter des produits au panier
# 5. Cliquez sur le bouton « Panier »
# 6. Vérifiez que la page du panier est affichée
# 7. Cliquez sur Passer à la caisse
# 8. Cliquez sur le bouton « S’inscrire / Se connecter »
# 9. Remplissez tous les détails dans Inscription et créez un compte
# 10. Vérifiez « COMPTE CRÉÉ ! » et cliquez sur le bouton « Continuer ».
# 11. Vérifiez « Connecté en tant que nom d’utilisateur » en haut de la page
# 12.Cliquez sur le bouton « Panier »
# 13. Cliquez sur le bouton « Passer à la caisse »
# 14. Vérifiez les détails de l’adresse et vérifiez votre commande
# 15. Entrez la description dans la zone de texte du commentaire et cliquez sur « Passer la commande »
# 16. Entrez les informations de paiement : Nom sur la carte, numéro de carte, CVC, date d’expiration
# 17. Cliquez sur le bouton « Payer et confirmer la commande »
# 18. Vérifiez le message de réussite « Votre commande a été passée avec succès ! »
# 19. Cliquez sur le bouton « Télécharger la facture » et vérifiez que la facture a été téléchargée avec succès.
# 20. Cliquez sur le bouton « Continuer »
# 21. Cliquez sur le bouton « Supprimer le compte »
# 22. Vérifiez « COMPTE SUPPRIMÉ ! » et cliquez sur le bouton « Continuer ».
