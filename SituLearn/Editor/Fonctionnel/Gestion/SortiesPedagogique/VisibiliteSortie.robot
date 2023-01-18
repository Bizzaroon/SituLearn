*** Settings ***
Documentation  Tests de créations de sorties
Library        Selenium2Library
Library        Collections
Resource       ../../../Prerequis.robot
Resource       CreerSortie.robot

*** Variables ***
${Latitude}
${Longitude}

*** Keywords ***
Publier une sortie Pédagogique Complète
    Creer chasse au trésor valide
    sleep  5
    click button  xpath://button[contains(text(),"Éditer carte / POI")]
    sleep  10
    click element  xpath://a[contains(@class,"fas fa-map-marker-plus add-marker")]
    click element  xpath://div[contains(@id,"fieldTripMap")]
    Input Text    xpath://div[1]/div/div/input  Point A
    ${Latitude}  Get Text  xpath://div[2]/div/div/input
    ${Latitude}  Get Text  xpath://div[3]/div/div/input
    click button  xpath://button[contains(text(),"Valider")]
    click button  xpath://button[contains(text(),"Revenir à la sortie")]
    sleep  5
    Input Text    xpath://div[1]/div[3]/svg/g/foreignObject/div/div/section/div[1]/div  Début de la sortie
    Input Text    xpath://div[5]/div[3]/svg/g/foreignObject/div/div/section/div[1]/div  Fin de la sortie

    Reload Page
    sleep  5

    click button  xpath://div[contains(text(),"Non publiée")]

Masquer une sortie pedagogique
    Creer chasse au trésor valide

    Wait until Page Contains Element  xpath://button[1]/i[contains(@class,"fas fa-eye")]  5
    Click Element  xpath://button[1]/i[contains(@class,"fas fa-eye")]

Rendre visible une sortie pedagogique
    Masquer une sortie pedagogique
    Wait until Page Contains Element  xpath://button[1]/i[contains(@class,"fas fa-eye-slash")]  5
    Click Element  xpath://button[1]/i[contains(@class,"fas fa-eye-slash")]