*** Settings ***
Documentation  Tests des filtres sur le domaine pédagogique
Library        Selenium2Library
Library        String
Library        Collections
Resource       ../../../Prerequis.robot
Resource       ../SortiesPedagogique/CreerSortie.robot

*** Variables ***
${test}


*** Keywords ***
Filtre Domaine Pedagogique Autre
    # Créer une sortie de type "Autre".
    Creer balade interactive valide
    Sleep    3s

    # Retourne au menu des sorties.
    Click Element    xpath://a[contains(text(),"Gestion des sorties pédagogiques")]
    Sleep    3s
    Element Text Should Be    xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div/div/div[1]/div[2]/h1    Gestion des sorties pédagogiques

    # Appuyer sur la selection du type de sortie
    Click Element    xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/table/thead/tr[2]/th[4]/span
    Sleep  2s

    # Appuyer sur le type "Autre"
    Click Element    xpath://ul/li[1]
    Sleep  2s

    # Affiche toutes les sorties.
    ${isPresent} =  Run Keyword And Return Status    Element Should Be Visible    xpath://button[@class='show-more btn btn-primary ']
    WHILE    ${isPresent}
        Click Button    xpath://button[@class='show-more btn btn-primary ']
        Sleep    2s
        ${isPresent} =  Run Keyword And Return Status    Element Should Be Visible    xpath://button[@class='show-more btn btn-primary ']
    END

    # Verifie que toutes les sorties sont de type Autre.
    ${isPresent} =    Run Keyword And Return Status    Element Should Be Visible    xpath://tr[1]/td[7]/div/div[5]/button/i[contains(@class,"fas fa-trash")]
    ${num}    Evaluate    0
    WHILE    ${isPresent}
        ${num}    Evaluate    ${num} + 1
        ${numTmp}    Evaluate    (${num} * 2) - 1
        Element Text Should Be  xpath://tr[${numTmp}]/td[4]  Autre
        ${numTmp}    Evaluate    ${numTmp} + 2
        ${isPresent} =    Run Keyword And Return Status    Element Should Be Visible    xpath://tr[${numTmp}]x
    END


Filtre Domaine Pedagogique Decouverte
    # Créer une sortie de type "Découverte".
    Creer balade interactive valide
    Sleep    3s
    Click Element    xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div[2]/div/div/div[2]/div[1]/div[2]/div/div/div[2]/div/div[3]/div[1]/div/div/div/input
    Sleep    1s
    Click Element    xpath://html/body/div[4]/ul/li[3]
    Click Element    xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div[1]/div/div[2]/button[1]
    Sleep    3s

    # Retourne au menu des sorties.
    Click Element    xpath://a[contains(text(),"Gestion des sorties pédagogiques")]
    Sleep    3s
    Element Text Should Be    xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div/div/div[1]/div[2]/h1    Gestion des sorties pédagogiques

    # Appuyer sur la selection du type de sortie
    Click Element    xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/table/thead/tr[2]/th[4]/span
    Sleep  2s

    # Appuyer sur le type "Découverte"
    Click Element    xpath://ul/li[2]
    Sleep  2s

    # Affiche toutes les sorties.
    ${isPresent} =  Run Keyword And Return Status    Element Should Be Visible    xpath://button[@class='show-more btn btn-primary ']
    WHILE    ${isPresent}
        Click Button    xpath://button[@class='show-more btn btn-primary ']
        Sleep    2s
        ${isPresent} =  Run Keyword And Return Status    Element Should Be Visible    xpath://button[@class='show-more btn btn-primary ']
    END

    # Verifie que toutes les sorties sont de type "Découverte".
    ${isPresent} =    Run Keyword And Return Status    Element Should Be Visible    xpath://tr[1]/td[7]/div/div[5]/button/i[contains(@class,"fas fa-trash")]
    ${num}    Evaluate    0
    WHILE    ${isPresent}
        ${num}    Evaluate    ${num} + 1
        ${numTmp}    Evaluate    (${num} * 2) - 1
        Element Text Should Be  xpath://tr[${numTmp}]/td[4]  Découverte
        ${numTmp}    Evaluate    ${numTmp} + 2
        ${isPresent} =    Run Keyword And Return Status    Element Should Be Visible    xpath://tr[${numTmp}]x
    END


Filtre Domaine Pedagogique Education physique et sportive
    # Créer une sortie de type "Education physique et sportive".
    Creer balade interactive valide
    Sleep    3s
    Click Element    xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div[2]/div/div/div[2]/div[1]/div[2]/div/div/div[2]/div/div[3]/div[1]/div/div/div/input
    Sleep    1s
    Click Element    xpath://html/body/div[4]/ul/li[4]
    Click Element    xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div[1]/div/div[2]/button[1]
    Sleep    3s

    # Retourne au menu des sorties.
    Click Element    xpath://a[contains(text(),"Gestion des sorties pédagogiques")]
    Sleep    3s
    Element Text Should Be    xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/div/div/div[1]/div[2]/h1    Gestion des sorties pédagogiques

    # Appuyer sur la selection du type de sortie
    Click Element    xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/table/thead/tr[2]/th[4]/span
    Sleep  2s

    # Appuyer sur le type "Education physique et sportive"
    Click Element    xpath://ul/li[3]
    Sleep  2s

    # Affiche toutes les sorties.
    ${isPresent} =  Run Keyword And Return Status    Element Should Be Visible    xpath://button[@class='show-more btn btn-primary ']
    WHILE    ${isPresent}
        Click Button    xpath://button[@class='show-more btn btn-primary ']
        Sleep    2s
        ${isPresent} =  Run Keyword And Return Status    Element Should Be Visible    xpath://button[@class='show-more btn btn-primary ']
    END

    # Verifie que toutes les sorties sont de type "Education physique et sportive".
    ${isPresent} =    Run Keyword And Return Status    Element Should Be Visible    xpath://tr[1]/td[7]/div/div[5]/button/i[contains(@class,"fas fa-trash")]
    ${num}    Evaluate    0
    WHILE    ${isPresent}
        ${num}    Evaluate    ${num} + 1
        ${numTmp}    Evaluate    (${num} * 2) - 1
        Element Text Should Be  xpath://tr[${numTmp}]/td[4]  Education Physique et Sportive
        ${numTmp}    Evaluate    ${numTmp} + 2
        ${isPresent} =    Run Keyword And Return Status    Element Should Be Visible    xpath://tr[${numTmp}]x
    END