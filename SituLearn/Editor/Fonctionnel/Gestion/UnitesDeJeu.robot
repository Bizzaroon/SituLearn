*** Settings ***
Documentation  Tests de créations de sorties
Library     Selenium2Library
Library     Collections
Resource    ../../Prerequis.robot
Resource    ../../../Library/FonctionPerso.robot
Resource    SortiesPedagogique/CreerSortie.robot

*** Variables ***

*** Keywords ***
Creer unite de jeu chasse au trésor
    Creer chasse au trésor valide
    sleep  2
    click button  xpath://button[contains(text(),"Éditer carte / POI")]
    sleep  10
    click element  xpath://a[contains(@class,"fas fa-map-marker-plus add-marker")]
    click element  xpath://div[contains(@id,"fieldTripMap")]
    Input Text    xpath://html/body/div[4]/div[1]/div[2]/div[1]/div/div/input  Point A
    ${Latitude}  Get Text  xpath://div[2]/div/div/input
    ${Latitude}  Get Text  xpath://div[3]/div/div/input
    click button  xpath://button[contains(text(),"Valider")]
    sleep  3
    click button  xpath://button[contains(text(),"Enregistrer la carte")]
    click button  xpath://button[contains(text(),"Revenir à la sortie")]
    sleep  3
    Click Element    xpath://a[contains(text(),"chasse au trésor")]
    sleep  3
    
    Input Text    xpath://svg/g/foreignObject/div/div/section/div[1]/div  Début de la sortie
    Input Text    xpath://div[5]/div[3]/svg/g/foreignObject/div/div/section/div[1]/div  Fin de la sortie

    sleep  5