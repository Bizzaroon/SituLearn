# Dans ce fichier vous retrouverez tous les cas de test en rapport avec les recherches par filtre pédagogique dans le Editor

*** Settings ***
Documentation  Tests des filtres sur le domaine pédagogique
Library        Selenium2Library
Library        String
Library        Collections
Resource       ../../../Prerequis.robot
Resource       ../SortiesPedagogique/CreerSortie.robot

*** Keywords ***
Filtre Domaine Pedagogique Autre
    Filtre Domaine Pedagogique    Autre    Découverte

Filtre Domaine Pedagogique Decouverte
    Filtre Domaine Pedagogique    Découverte    Autre

Filtre Domaine Pedagogique Education physique et sportive
    Filtre Domaine Pedagogique    Education Physique et Sportive    Découverte  

Filtre Domaine Pedagogique Geographie
    Filtre Domaine Pedagogique    Géographie    Education Physique et Sportive

Filtre Domaine Pedagogique Histoire
    Filtre Domaine Pedagogique    Histoire    Géographie

Filtre Domaine Pedagogique Musee
    Filtre Domaine Pedagogique    Musée    Histoire

Filtre Domaine Pedagogique SVT
    Filtre Domaine Pedagogique    SVT    Musée

# Arguments 
#     theme: correspond au thème que l'on recherche
#     themeTemoin: correspond au thème qui verfifie qu'il n'est pas trouver, doit etre différent de theme 
Filtre Domaine Pedagogique
    [Arguments]    ${theme}    ${themeTemoin}

    # Se connecter a Situlearn
    Connecter situlearnEditor

    # Creation d'une sortie avec un theme temoin
    Cree Balade Interactive Valide Et Modifier Theme    ${themeTemoin}
    Retoure au Menu

    # Creation d'une sortie avec le theme que l'on veux filtrer
    Cree Balade Interactive Valide Et Modifier Theme    ${theme}
    Retoure au Menu

    # Appuyer sur la selection du theme de sortie
    Click Element    xpath://html/body/div[1]/div/div[2]/div[3]/div[1]/table/thead/tr[2]/th[4]/span
    Wait Until Element Is Visible  xpath://ul/li[text()='${theme}']

    # Appuyer sur le theme que l'on veut filtrer
    Click Element    xpath://ul/li[text()='${theme}']
    Sleep    2s

    # Verifier dans la liste des sorties qu'il n'y a que des sorties du theme que l'on filtre
    Verifie Theme    ${theme}

# Arguments 
#     theme: correspond au thème de la sortie qui sera créée
Cree Balade Interactive Valide Et Modifier Theme
    [Arguments]    ${theme}
    # Créer une sortie de type autre.
    click button    xpath://button[contains(text(),"Ajouter une sortie")]
    Input Text    xpath://input[contains(@placeholder,"Nom de la sortie")]  balade
    Input Text    xpath://textarea[contains(@placeholder,"Description")]  C'est une balade
    click button    xpath://input[contains(@placeholder,"Domaine pédagogique")]
    Wait Until Element Is Visible    xpath://li[contains(text(),"${theme}")]  5
    Click Element   xpath://li[contains(text(),"${theme}")]
    click button    xpath://button[contains(text(),"Enregistrer")]

Retoure au Menu
    # Retourne au menu des sorties.
    Wait Until Element Is Visible    xpath://a[contains(text(),"Gestion des sorties pédagogiques")]
    Sleep    1s
    Click Element    xpath://a[contains(text(),"Gestion des sorties pédagogiques")]
    Sleep    1s
    Element Text Should Be    xpath://div[1]/div/div[2]/div[3]/div[1]/div/div/div[1]/div[2]/h1    Gestion des sorties pédagogiques

# Arguments 
#     theme: correspond au thème que l'on veut vérifier et trouver sur la page des sorties
Verifie Theme
    [Arguments]    ${theme}

    # Verifie qu'au moins un element s'y trouve (la sortie cree précédemment)
    Element Should Not Be Visible    xpath://tr[1]/td[@colspan=7]

    # Affiche toutes les sorties.
    ${isPresent} =  Run Keyword And Return Status    Element Should Be Visible    xpath://button[@class='show-more btn btn-primary ']
    WHILE    ${isPresent}
        Click Button    xpath://button[@class='show-more btn btn-primary ']
        Sleep    2s
        ${isPresent} =  Run Keyword And Return Status    Element Should Be Visible    xpath://button[@class='show-more btn btn-primary ']
    END

    # Verifie que toutes les sorties sont du type que l'on filtre.
    ${isPresent} =    Run Keyword And Return Status    Element Should Be Visible    xpath://tr[1]/td[7]/div/div[5]/button/i[contains(@class,"fas fa-trash")]
    ${num}    Evaluate    0
    WHILE    ${isPresent}
        ${num}    Evaluate    ${num} + 1
        ${numTmp}    Evaluate    (${num} * 2) - 1
        Element Text Should Be  xpath://tr[${numTmp}]/td[4]  ${theme}
        ${numTmp}    Evaluate    ${numTmp} + 2
        ${isPresent} =    Run Keyword And Return Status    Element Should Be Visible    xpath://tr[${numTmp}]x
    END