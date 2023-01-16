*** Settings ***
Library     AppiumLibrary

*** Keywords ***

Bad Login 1 Test
    # Attendre l'ecran de chargement
    Wait Until Element Is Visible   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.widget.EditText    240     Chargement trop long, plus de 4min.

    # Appuyer sur le bouton de connexion
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Sleep   3s

    # Vérification d'erreur.
    Wait Until Page Contains   Veuillez corriger les erreurs suivantes     10
    Wait Until Page Contains    Mot de passe requis     10
    Wait Until Page Contains    Adresse email requise   10

Bad Login 2 Test
    [Arguments]     ${email}
    # Attendre l'ecran de chargement
    Wait Until Element Is Visible   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.widget.EditText    240     Chargement trop long, plus de 4min.

    # Remplir le login
    Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[3]/android.widget.EditText    ${email}

    # Remplir le mot de passe
    Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[4]/android.widget.EditText   pas le bon :(
    Sleep   1s

    # Appuyer sur le bouton de connexion
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Sleep   3s

    # Vérification d'erreur.
    Wait Until Page Contains   Veuillez corriger les erreurs suivantes     10
    Wait Until Page Contains    Données invalides   10

Bad Login 3 Test
    [Arguments]     ${pwd}
    # Attendre l'ecran de chargement
    Wait Until Element Is Visible   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.widget.EditText    240     Chargement trop long, plus de 4min.

    # Remplir le login
    Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[3]/android.widget.EditText    pas_le_bon_:(@deso.com

    # Remplir le mot de passe
    Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[4]/android.widget.EditText   ${pwd}
    Sleep   1s

    # Appuyer sur le bouton de connexion
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Sleep   3s

    # Vérification d'erreur.
    Wait Until Page Contains   Veuillez corriger les erreurs suivantes     10
    Wait Until Page Contains    Données invalides   10

Good Login Test
    [Arguments]     ${email}    ${pwd}
    # Attendre l'ecran de chargement
    Wait Until Element Is Visible   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.widget.EditText    240     Chargement trop long, plus de 4min.

    # Remplir le login
    Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[3]/android.widget.EditText    ${email}

    # Remplir le mot de passe
    Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[4]/android.widget.EditText   ${pwd}
    Sleep   1s

    # Appuyer sur le bouton de connexion
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Sleep   4s

    # Vérification de la connexion en regardant le text "Catalogue des sorties"
    ${present}=  Run Keyword And Return Status    Wait Until Page Contains   WHILE USING THE APP     10
    Run Keyword If    ${present}    Close Location Popup
    Wait Until Page Contains      Catalogue des sorties  10

Close Location Popup
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.Button[1]