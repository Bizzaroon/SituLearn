#Test sur la visibilité des sorties par les créateurs

*** Settings ***
Documentation  Tests de créations de sorties
Library        Selenium2Library
Library        Collections
Library        Dialogs
Resource       ../../../Prerequis.robot
Resource       CreerSortie.robot

*** Variables ***
${Latitude}
${Longitude}

*** Keywords ***

#Publie une sortie si celle ci est valide (un début, une activité et une fin)
Publier une sortie Pédagogique Complète
    Creer chasse au trésor valide
    Wait Until Element Is Visible    xpath://button[contains(text(),"Éditer la carte")]
    click button  xpath://button[contains(text(),"Éditer la carte")]
    Wait Until Element Is Visible    xpath://a[contains(@class,"fas fa-map-marker-plus add-marker")]  10
    click element  xpath://a[contains(@class,"fas fa-map-marker-plus add-marker")]
    click element  xpath://div[contains(@id,"fieldTripMap")]
    Wait until Page Contains Element  xpath://input[contains(@class,"e-textbox")]
    Input Text    xpath://input[contains(@class,"e-textbox")]  Point A
    ${Latitude}  Get Text  xpath://div[2]/div/div/input
    ${Longitude}  Get Text  xpath://div[3]/div/div/input
    click button  xpath://button[contains(text(),"Valider")]
    Wait Until Element Is Not Visible    xpath://button[contains(text(),"Valider")]
    click button  xpath://button[contains(text(),"Enregistrer et retourner à la sortie")]
    Wait Until Element Is Visible    xpath://div[contains(@class,"home-page-preview")]/section/div[1]
    Click Element    xpath://div[contains(@class,"home-page-preview")]/section/div[1]
    Press Keys    NONE    DEBUT
    Wait Until Element Is Visible    xpath://div[contains(@class,"end-page-preview")]/section/div[1] 
    Click Element    xpath://div[contains(@class,"end-page-preview")]/section/div[1]
    Press Keys    NONE    FIN

    Wait until Page Contains Element  xpath://button[contains(text(),"Enregistrer")]  5
    Click Element  xpath://button[contains(text(),"Enregistrer")]

    # Ca me parer bizarre de devoir reload la page pour la publier, sans reload la checkbox est bloquée (ce qui me parer d'etre un bug)
    Reload Page

    Wait Until Element Is Visible    xpath://div[contains(@class, "fieldtrip-edition-publication-publish")]    15
    ${aria_checked_value}=  Get Element Attribute  xpath://div[contains(@class, "fieldtrip-edition-publication-publish")]/div    aria-checked
    Should Be Equal    ${aria_checked_value}     false
    Wait until Page Contains Element    xpath://div[contains(@class, "fieldtrip-edition-publication-publish")]/div/span[1]
    Click Element  xpath://div[contains(@class, "fieldtrip-edition-publication-publish")]/div/span[1]
    ${aria_checked_value}=  Get Element Attribute  xpath://div[contains(@class, "fieldtrip-edition-publication-publish")]/div    aria-checked
    Should Be Equal    ${aria_checked_value}     true

#Masque une sortie visible
Masquer une sortie pedagogique
    Creer chasse au trésor valide

    ${aria_checked_value}=  Get Element Attribute  xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div[2]/div/div/div[2]/div[1]/div[2]/div/div/div[3]/div[2]/div[1]/div    aria-checked
    Should Be Equal    ${aria_checked_value}     true

    Wait until Page Contains Element  xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div[2]/div/div/div[2]/div[1]/div[2]/div/div/div[3]/div[2]/div[1]/div/span[1]  5
    Click Element  xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div[2]/div/div/div[2]/div[1]/div[2]/div/div/div[3]/div[2]/div[1]/div/span[1]
    
    Wait until Page Contains Element  xpath://button[contains(text(),"Enregistrer")]  5
    Click Element  xpath://button[contains(text(),"Enregistrer")]
    
    ${aria_checked_value}=  Get Element Attribute  xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div[2]/div/div/div[2]/div[1]/div[2]/div/div/div[3]/div[2]/div[1]/div    aria-checked
    Should Be Equal    ${aria_checked_value}     false


#Rend visible une sortie qui ne l'est pas
Rendre visible une sortie pedagogique
    Masquer une sortie pedagogique
    
    ${aria_checked_value}=  Get Element Attribute  xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div[2]/div/div/div[2]/div[1]/div[2]/div/div/div[3]/div[2]/div[1]/div    aria-checked
    Should Be Equal    ${aria_checked_value}     false

    Wait until Page Contains Element  xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div[2]/div/div/div[2]/div[1]/div[2]/div/div/div[3]/div[2]/div[1]/div/span[1]  5
    Click Element  xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div[2]/div/div/div[2]/div[1]/div[2]/div/div/div[3]/div[2]/div[1]/div/span[1]
    
    Wait until Page Contains Element  xpath://button[contains(text(),"Enregistrer")]  5
    Click Element  xpath://button[contains(text(),"Enregistrer")]

    ${aria_checked_value}=  Get Element Attribute  xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div[2]/div/div/div[2]/div[1]/div[2]/div/div/div[3]/div[2]/div[1]/div    aria-checked
    Should Be Equal    ${aria_checked_value}     true