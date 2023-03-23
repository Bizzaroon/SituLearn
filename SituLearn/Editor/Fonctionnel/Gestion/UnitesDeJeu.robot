#Les différents tests sur les unités de jeu (ne prend pas en compte les activités)

*** Settings ***
Documentation  Tests de créations de sorties
Library     Selenium2Library
Library     Collections
Resource    ../../Prerequis.robot
Resource    ../../../Library/FonctionPerso.robot
Resource    SortiesPedagogique/CreerSortie.robot

*** Keywords ***
Creer unite de jeu chasse au trésor
    Creer chasse au trésor valide
    sleep  2
    click button  xpath://button[contains(text(),"Éditer la carte")]
    Wait Until Element Is Visible    //a[contains(@class,"fas fa-map-marker-plus add-marker")]  15
    click element  xpath://a[contains(@class,"fas fa-map-marker-plus add-marker")]
    click element  xpath://div[contains(@id,"fieldTripMap")]
    Input Text    xpath://html/body/div[4]/div[1]/div[2]/div[1]/div/div/input  Point A
    ${Latitude}  Get Text  xpath://div[2]/div/div/input
    ${Latitude}  Get Text  xpath://div[3]/div/div/input
    click button  xpath://button[contains(text(),"Valider")]
    sleep  5
    click button  xpath://button[contains(text(),"Enregistrer la carte")]
    click button  xpath://button[contains(text(),"Revenir à la sortie")]
    sleep  5
    Click Element    xpath://a[contains(text(),"chasse au trésor")]
    sleep  4
    
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath://section/div[1]/div[contains(@class,"-editable-value-container")]
    sleep  1
    Input Text    xpath://section/div[1]/div/div/div/div/div/div[1]/div[3]/div[contains(@class,"e-content")]  Début de la sortie
    sleep  1
    Click Element    xpath://section/div[1]/div[contains(@class,"-editable-value-container")]  #On le refait une fois, en cliquant dessus le précédent champs s'était transformé et n'existe plus
    sleep  3  #Laisse le temps au 1er champs de se retransformer comme il n'est plus sélectionné il reprend sa forme initial
    Input Text    xpath://section/div[1]/div/div/div/div/div/div[1]/div[3]/div[contains(@class,"e-content")]  Fin de la sortie
    Click Button     xpath://button[contains(text(),"Enregistrer")]
    sleep  2

Creer unite de jeu balade intérative
    Creer balade interactive valide
    sleep  2
    click button  xpath://button[contains(text(),"Éditer la carte")]
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
    Click Element    xpath://a[contains(text(),"balade")]
    sleep  4
    
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath://section/div[1]/div[contains(@class,"-editable-value-container")]
    sleep  1
    Input Text    xpath://section/div[1]/div/div/div/div/div/div[1]/div[3]/div[contains(@class,"e-content")]  Début de la sortie
    sleep  1
    Click Element    xpath://section/div[1]/div[contains(@class,"-editable-value-container")]  #On le refait une fois, en cliquant dessus le précédent champs s'était transformé et n'existe plus
    sleep  3  #Laisse le temps au 1er champs de se retransformer comme il n'est plus sélectionné il reprend sa forme initial
    Input Text    xpath://section/div[1]/div/div/div/div/div/div[1]/div[3]/div[contains(@class,"e-content")]  Fin de la sortie
    Click Button     xpath://button[contains(text(),"Enregistrer")]
    sleep  2

Creer unite de jeu hub d'activite
    Creer hub d'activité valide
    sleep  2
    click button  xpath://button[contains(text(),"Éditer la carte")]
    Wait Until Element Is Visible    xpath://a[contains(@class,"fas fa-map-marker-plus add-marker")]  10
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
    Click Element    xpath://a[contains(text(),"Hub d'activité")]
    sleep  4
    
    Click Element    xpath://section/div[1]/div[contains(@class,"-editable-value-container")]
    sleep  1
    Input Text    xpath://section/div[1]/div/div/div/div/div/div[1]/div[3]/div[contains(@class,"e-content")]  Début de la sortie
    sleep  1
    Click Element    xpath://section/div[1]/div[contains(@class,"-editable-value-container")]  #On le refait une fois, en cliquant dessus le précédent champs s'était transformé et n'existe plus
    sleep  3  #Laisse le temps au 1er champs de se retransformer, comme il n'est plus sélectionné il reprend sa forme initial
    Input Text    xpath://section/div[1]/div/div/div/div/div/div[1]/div[3]/div[contains(@class,"e-content")]  Fin de la sortie
    Click Button     xpath://button[contains(text(),"Enregistrer")]
    sleep  2

#Importe une unité de jeu valide
Importer une unité de jeu
    Creer unite de jeu chasse au trésor
    Redirection page d'acceuil
    Creer chasse au trésor valide
    Click Element    xpath://i[contains(@class,"fas fa-upload")]
    Wait Until Element Is Visible    xpath://table/thead/tr[1]  20
    Click Element    xpath://table/thead/tr[2]/th[5]/span
    Wait Until Element Is Visible    //li[text()="Luc Dupond"]  3
    Click Element    //li[text()="Luc Dupond"]
    Input Text    xpath://input    Point A
    sleep  3
    Click Element  xpath://i[contains(@class,"fas fa-plus")]
    sleep  3
    Wait Until Element Is Visible    xpath://button[contains(text(),"Enregistrer")]  5
    Click Element    xpath://button[contains(text(),"Enregistrer")]
    sleep  1