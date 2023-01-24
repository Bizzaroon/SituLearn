*** Settings ***
Resource         Prerequis.robot
Resource         Fonctionnel/Gestion/CompteUtilisateur.robot
Resource         Fonctionnel/Gestion/Notification.robot
Test Teardown    Close Application

*** Test Cases ***
User Test
    ${email}    Set Variable   SitulearnTestPlayer@gmail.com
    ${pwd}  Set Variable     SituLearn
    Open SituLearnPlayer
    Bad Login 1 User
    Prerequis.Reload Page
    Bad Login 2 User    ${email}
    Prerequis.Reload Page
    Bad Login 3 User    ${pwd}
    Prerequis.Reload Page
    Good Login User  ${email}    ${pwd}
    Visualize User  ${email}
    Modify User
    Logout User
    Good Login User  ${email}    ${pwd}
    Delete User
    Check Delete User   ${email}    ${pwd} 

Notifier Test
    Notifier une Proximité d’un POI Valide