#Test sur la modification de sortie déjà créer

*** Settings ***
Documentation  Tests de créations de sorties
Library        Selenium2Library
Library        Collections
Resource       ../../../Prerequis.robot
Resource       CreerSortie.robot
Resource       ../../../../Library/FonctionPerso.robot
Resource       ../../../Variable.robot

*** Keywords ***

#Test de mettre le nom d'une sortie à vide
Modifier nom sortie vide
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
                Clear Element Text    xpath://input[contains(@placeholder,"Nom de la sortie")]
                click button  xpath://button[contains(text(),"Enregistrer")]
                Wait until Page Contains Element  xpath://div[contains(@class, "alert alert-danger0")]  2  #Message d'erreur élément vide
                BREAK
            END
        END
        ${cpt}  Evaluate  ${cpt}+1
    END

#Test modifie une balade interactive
Modifier balade interactive valide
    Creer balade interactive valide
    Redirection page d'acceuil

    ${cpt}  Evaluate  0
    
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

#Test modifie hub d'activite
Modifier hub d'activite valide
    ${cpt}  Evaluate  0
    Creer hub d'activité valide
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
                Input Text    xpath://input[contains(@placeholder,"Nom de la sortie")]  hub d'activite
                click button  xpath://button[contains(text(),"Enregistrer")]
                BREAK
            END
        END
        ${cpt}  Evaluate  ${cpt}+1
    END

#Test modifie chasse au trésor
Modifier chasse au trésor valide
    ${cpt}  Evaluate  0
    Creer chasse au trésor valide
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
                Input Text    xpath://input[contains(@placeholder,"Nom de la sortie")]  chasse au trésor
                click button  xpath://button[contains(text(),"Enregistrer")]
                BREAK
            END
        END
        ${cpt}  Evaluate  ${cpt}+1
    END

#Test suprime une sortie
Supprimer une sortie
    ${nomSortie}    Set Variable    Hub d'activité
    ${cpt}  Evaluate  0
    Creer hub d'activité valide
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
                click Element  xpath://tr[${cpt}]/td[7]/div/div[5]/button/i[contains(@class,"fas fa-trash")]
                sleep  1
                click button   xpath://button[contains(text(),"Oui")]
                BREAK
            END
        END
        ${cpt}  Evaluate  ${cpt}+1
    END
    sleep  2