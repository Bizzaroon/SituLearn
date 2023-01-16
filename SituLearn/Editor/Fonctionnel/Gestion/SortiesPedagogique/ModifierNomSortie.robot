*** Settings ***
Documentation  Tests de créations de sorties
Library        Selenium2Library
Library        Collections
Resource       ../../../Prerequis.robot
Resource       CreerSortie.robot
Resource    ../../../../Library/FonctionPerso.robot

*** Variables ***
${NOM_SORTIE}   balade
${Element}
${ListeEnfants}
${Enfant}
${TextEnfant}
${cpt}  0

*** Keywords ***
Modifier balade interactive valide
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
                click Element  xpath://tr[${cpt}]/td[7]/div/div[4]/button/i[contains(@class,"fas fa-edit")]
                Input Text    xpath://input[contains(@placeholder,"Nom de la sortie")]  balade interactive
                click button  xpath://button[contains(text(),"Enregistrer")]
                BREAK
            END
        END
        ${cpt}  Evaluate  ${cpt}+1
    END
    sleep  1
    Redirection page d'acceuil
    Supprimer activite  balade interactive