*** Settings ***
Documentation  Tests de créations de sorties
Library        Selenium2Library
Library        Collections
Resource       ../../../Prerequis.robot

*** Variables ***
${NOM_SORTIE}   balade
${Element}
${ListeEnfants}
${Enfant}
${TextEnfant}
${cpt}  0

*** Keywords ***
Dupliquer Sortie
    Creer balade interactive valide
    Redirection page d'acceuil
    @{lstElement}  Get Child Webelements  xpath://tbody[contains(@style,"overflow-anchor: none;")]

    FOR  ${Element}  IN  @{lstElement}
        ${ListeEnfants}  Get Child Webelements  ${Element}
        ${taille}  Get Length  ${ListeEnfants}

        IF  ${taille} > 0
            ${ElementEnfant}  Get From List  ${ListeEnfants}  0
            ${TextEnfant}  Get Text  ${ElementEnfant}

            IF  "${TextEnfant}" == "${NOM_SORTIE}"
                click Element   xpath://tr[${cpt}]/td[7]/div/div[4]/button/i[contains(@class,"fas fa-edit")]
                Wait until Page Contains Element  xpath:/html/body/div[1]/div/div[2]/div[3]/div[1]/div[1]/div/div[2]/button[2]/i  20
                click Element   xpath:/html/body/div[1]/div/div[2]/div[3]/div[1]/div[1]/div/div[2]/button[2]/i
                Wait until Page Contains Element  xpath://input[contains(@placeholder,"Nom de la sortie")]  20
                ${value}    Get Element Attribute  xpath://input[contains(@placeholder,"Nom de la sortie")]  value
                log to console  ${value}
                BREAK
            END
        END
        ${cpt}  Evaluate  ${cpt}+1
    END
#    Redirection page d'acceuil
#    sleep  1
#    Supprimer activite  balade interactive

#Renvoi les enfants d'un élément
Get Child Webelements
    [Arguments]    ${locator}

    ${element}  Get WebElement  ${locator}
    ${children}  Call Method  ${element}  find_elements  by=xpath  value=child::*

    [Return]  ${children}