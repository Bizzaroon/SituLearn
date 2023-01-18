*** Settings ***
Documentation  Tests de créations de sorties
Library        Selenium2Library
Library        String
Library        Collections
Resource       ../../Prerequis.robot

*** Variables ***
${Nom_Utilisateur}
${Prenom_Utilisateur}
${Comparaison}
${Truc}
${Rien}

*** Keywords ***

Connection situlearnEditor
    [Arguments]  ${MAIL}  ${MDP}
    Open Browser    ${PAGE}   ${BROWSER}
    Wait until Page Contains Element  xpath://div[contains(text(),"Veuillez vous connecter")]  35
    Input Text    name:email     ${MAIL}
    Input Text    name:password  ${MDP}
    click button    xpath://button[contains(text(),"Connexion")]
    Wait until Page Contains Element  xpath://h1[contains(text(),"Gestion des sorties pédagogiques")]  10
    Sleep  2

Deconnection situlearnEditor
    Connecter situlearnEditor
    click element  xpath://img[contains(@class,"avatar-icon rounded d-inline")]
    click button  xpath://button[contains(text(),"Déconnexion")]

Modifier profil prénom
    [Arguments]  ${PRENOM}
    Connecter situlearnEditor
    click element  xpath://img[contains(@class,"avatar-icon rounded d-inline")]
    click element  xpath://div[contains(text(),"Mon compte")]
    click element  xpath://i[contains(@class,"fas fa-1x fa-edit")]
    Input Text  xpath://div[2]/span/input  ${PRENOM}
    click button   xpath://button[contains(text(),"Valider")]
    Wait Until Page Does Not Contain Element  xpath://button[contains(text(),"Valider")]
    Redirection page d'acceuil
    click element  xpath://img[contains(@class,"avatar-icon rounded d-inline")]
    Sleep  1
    ${Prenom_Utilisateur}  getText  xpath://html/body/div[1]/div/div[1]/div[3]/div[2]/div/div/div/div[1]/div/div/div[1]/div/div[2]/div/div/div[2]/div[1]
    log to Console  ${Prenom_Utilisateur}
    ${Comparaison}  Split String  ${Prenom_Utilisateur}
    ${Truc}  Get From List  ${Comparaison}  0
    log to Console  ${Truc}
    Should Be Equal As Strings  ${PRENOM}  ${Truc}

Modifier profil prénom vide
    Connecter situlearnEditor
    click element  xpath://img[contains(@class,"avatar-icon rounded d-inline")]
    click element  xpath://div[contains(text(),"Mon compte")]
    click element  xpath://i[contains(@class,"fas fa-1x fa-edit")]
    Input Text  xpath://div[2]/span/input    ${Rien}
    click button   xpath://button[contains(text(),"Valider")]
    sleep  1
    Page Should Contain    xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div[2]/div/div[1]/div/div[2]/div[1]

Modifier profil nom
    [Arguments]  ${NOM}
    Connecter situlearnEditor
    click element  xpath://img[contains(@class,"avatar-icon rounded d-inline")]
    click element  xpath://div[contains(text(),"Mon compte")]
    click element  xpath://i[contains(@class,"fas fa-1x fa-edit")]
    Input Text  xpath://div[1]/span/input  ${NOM}
    click button   xpath://button[contains(text(),"Valider")]
    Wait Until Page Does Not Contain Element  xpath://button[contains(text(),"Valider")]
    Redirection page d'acceuil
    click element  xpath://img[contains(@class,"avatar-icon rounded d-inline")]
    Sleep  1
    ${Nom_Utilisateur}  getText  xpath://html/body/div[1]/div/div[1]/div[3]/div[2]/div/div/div/div[1]/div/div/div[1]/div/div[2]/div/div/div[2]/div[1]
    log to Console  ${Nom_Utilisateur}
    ${Comparaison}  Split String  ${Nom_Utilisateur}
    ${Truc}  Get From List  ${Comparaison}  1
    log to Console  ${Truc}
    Should Be Equal As Strings  ${NOM}  ${Truc}