*** Settings ***
Resource         Prerequis.robot
Resource         Fonctionnel/Gestion/CompteUtilisateur.robot
Test Teardown     Close Application

*** Test Cases ***
User Test
    ${email}    Set Variable   SitulearnTestPlayer@gmail.com
    ${pwd}  Set Variable     SituLearn
    Open SituLearnPlayer
    Bad Login 1 User
    Reload Page
    Bad Login 2 User    ${email}
    Reload Page
    Bad Login 3 User    ${pwd}
    Reload Page
    Good Login User  ${email}    ${pwd}
    Visualize User  ${email}
    Modify User
    Logout User
    Good Login User  ${email}    ${pwd}
    Delete User
    Check Delete User   ${email}    ${pwd} 