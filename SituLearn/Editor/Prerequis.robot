*** Settings ***
Documentation  Tests de créations de sorties
Library        Selenium2Library
Resource       ./Fonctionnel/Gestion/CompteUtilisateur.robot
Resource       ../Library/FonctionPerso.robot

*** Variables ***
${PAGE}     https://situlearn-editor.univ-lemans.fr/login
${BROWSER}  Firefox
${cpt}  0

*** Keywords ***
Connecter situlearnEditor
    Connection situlearnEditor  testsitulearn@gmail.com  TestSituLearn1234

Redirection page d'acceuil
    Click Element  xpath://html/body/div[1]/div/div[2]/div[2]/div[2]/div[1]/div[1]/div/li/a/i
    Wait until Page Contains Element  xpath://th[contains(text(),"Nom de la sortie")]  20
    sleep  2

Supprimer activite
    [Arguments]  ${nomActivite}
    Redirection page d'acceuil
    @{lstElement}  Get Child Webelements  xpath://tbody[contains(@style,"overflow-anchor: none;")]

    FOR  ${Element}  IN  @{lstElement}
        ${ListeEnfants}  Get Child Webelements  ${Element}
        ${taille}  Get Length  ${ListeEnfants}

        IF  ${taille} > 0
            ${ElementEnfant}  Get From List  ${ListeEnfants}  0
            ${TextEnfant}  Get Text  ${ElementEnfant}

            IF  "${TextEnfant}" == "${nomActivite}"
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

