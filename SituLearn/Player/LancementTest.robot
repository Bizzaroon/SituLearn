*** Settings ***
Resource         Prerequis.robot
Resource         Fonctionnel/Gestion/CompteUtilisateur/connexion.robot
Resource         Fonctionnel/Gestion/CompteUtilisateur/visualize.robot
Resource         Fonctionnel/Gestion/CompteUtilisateur/modify.robot
Resource         Fonctionnel/Gestion/CompteUtilisateur/deconnexion.robot
Resource         Fonctionnel/Gestion/CompteUtilisateur/delete.robot
Test Teardown     Close Application

*** Test Cases ***
User Test
    ${email}    Set Variable   SitulearnTestPlayer@gmail.com
    ${pwd}  Set Variable     SituLearn
    Open SituLearnPlayer
    Bad Login 1 Test
    Reload Page
    Bad Login 2 Test    ${email}
    Reload Page
    Bad Login 3 Test    ${pwd}
    Reload Page
    Good Login Test  ${email}    ${pwd}
    Visualize Test  ${email}
    Modify Test
    Logout Test
    Good Login Test  ${email}    ${pwd}
    Delete Test
    #Check Delete Test   ${email}    ${pwd} 