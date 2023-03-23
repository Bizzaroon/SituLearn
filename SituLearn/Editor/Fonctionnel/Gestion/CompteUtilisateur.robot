*** Settings ***
Documentation  Tests de créations de sorties
Library        Selenium2Library
Library        String
Library        Collections
Resource       ../../Prerequis.robot
Resource       ../../Variable.robot

*** Keywords ***

#Se connecte au site situlearnEditor
#Arguments
#    MAIL : mail utilisé pour se connecter
#    MDP  : mot de passe utilisé pour se connecter
Connection situlearnEditor
    [Arguments]  ${MAIL}  ${MDP}
    Open Firefox
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

#Modifie le profil de l'utilisateur
#Arguments 
#    PRENOM : le nouveau prénom de l'utilisateur
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
    ${Nouveau_Prenom}  Get From List  ${Comparaison}  0
    Should Be Equal As Strings  ${PRENOM}  ${Nouveau_Prenom}

#Mettre le prénom à vide
Modifier profil prénom vide
    Connecter situlearnEditor

    click element  xpath://img[contains(@class,"avatar-icon rounded d-inline")]
    click element  xpath://div[contains(text(),"Mon compte")]
    click element  xpath://i[contains(@class,"fas fa-1x fa-edit")]
    Input Text  xpath://div[2]/span/input    ${Rien}
    click button   xpath://button[contains(text(),"Valider")]
    sleep  1
    Page Should Contain    xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div[2]/div/div[1]/div/div[2]/div[1]

#Modifie le nom de l'utilisateur
#Arguments 
#    NOM : le nouveau prénom de l'utilisateur
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
    ${Nouveau_Nom}  Get From List  ${Comparaison}  1
    log to Console  ${Nouveau_Nom}
    Should Be Equal As Strings  ${NOM}  ${Nouveau_Nom}