*** Settings ***
Documentation  Tests de créations de sorties
Library        Selenium2Library
Resource       ../../../Prerequis.robot

*** Keywords ***
Creer balade interactive valide
    Connecter situlearnEditor
    click button    xpath://button[contains(text(),"Ajouter une sortie")]
    Input Text    xpath://input[contains(@placeholder,"Nom de la sortie")]  balade
    Input Text    xpath://textarea[contains(@placeholder,"Description")]  C'est une balade
    click button    xpath://input[contains(@placeholder,"Domaine pédagogique")]
    Wait Until Element Is Visible    xpath://li[contains(text(),"Autre")]  5
    Click Element   xpath://li[contains(text(),"Autre")]
    click button    xpath://input[contains(@placeholder,"Type")]
    Wait Until Element Is Visible    xpath://li[contains(text(),"Balade interactive")]  5
    Click Element   xpath://li[contains(text(),"Balade interactive")]
    click button    xpath://button[contains(text(),"Enregistrer")]

Creer chasse au trésor valide
    Connecter situlearnEditor
    click button    xpath://button[contains(text(),"Ajouter une sortie")]
    Input Text    xpath://input[contains(@placeholder,"Nom de la sortie")]  chasse au trésor
    Input Text    xpath://textarea[contains(@placeholder,"Description")]  C'est une chasse au trésor
    click button    xpath://input[contains(@placeholder,"Domaine pédagogique")]
    Wait Until Element Is Visible    xpath://li[contains(text(),"Découverte")]  5
    Click Element   xpath://li[contains(text(),"Découverte")]
    click button    xpath://input[contains(@placeholder,"Type")]
    Wait Until Element Is Visible    xpath://li[contains(text(),"Chasse au trésor")]  5
    Click Element   xpath://li[contains(text(),"Chasse au trésor")]
    click button    xpath://button[contains(text(),"Enregistrer")]
    Sleep  2

Creer hub d'activité valide
    Connecter situlearnEditor
    click button    xpath://button[contains(text(),"Ajouter une sortie")]
    Input Text    xpath://input[contains(@placeholder,"Nom de la sortie")]  Hub d'activité
    Input Text    xpath://textarea[contains(@placeholder,"Description")]  C'est un hub d'activité
    click button    xpath://input[contains(@placeholder,"Domaine pédagogique")]
    Wait Until Element Is Visible    xpath://li[contains(text(),"Education Physique et Sportive")]  5
    Click Element   xpath://li[contains(text(),"Education Physique et Sportive")]
    click button    xpath://input[contains(@placeholder,"Type")]
    Wait Until Element Is Visible    xpath://li[contains(text(),"Hub d'activités")]  5
    Click Element   xpath://li[contains(text(),"Hub d'activités")]
    click button    xpath://button[contains(text(),"Enregistrer")]
    Sleep  2