*** Settings ***
Documentation  Tests de créations de sorties
Library        Selenium2Library
Library        Collections
Resource       ../../../Prerequis.robot
Resource    ../../../../Library/FonctionPerso.robot
Resource    CreerSortie.robot

*** Variables ***
${SORTIE}
${cpt}  0

*** Keywords ***
Tester Sortie
    [Arguments]  ${nomSortie}
    Redirection page d'acceuil
    @{lstElement}  Get Child Webelements  xpath://tbody[contains(@style,"overflow-anchor: none;")]

    FOR  ${Element}  IN  @{lstElement}
        ${ListeEnfants}  Get Child Webelements  ${Element}
        ${taille}  Get Length  ${ListeEnfants}

        IF  ${taille} > 0
            ${ElementEnfant}  Get From List  ${ListeEnfants}  0
            ${TextEnfant}  Get Text  ${ElementEnfant}

            IF  "${TextEnfant}" == "${nomSortie}"
                log to console   ${TextEnfant}
                click Element  xpath://tr[${cpt}]/td[7]/div/div[5]/button/i[contains(@class,"fas fa-play")]
                sleep  1
                click button  xpath://input[contains(text(),"Commencer")]
                
                BREAK
            END
        END
        ${cpt}  Evaluate  ${cpt}+1
    END
    sleep  2

