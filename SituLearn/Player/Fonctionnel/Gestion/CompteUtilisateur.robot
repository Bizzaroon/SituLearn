*** Settings ***
Library     AppiumLibrary

*** Keywords ***

### Login ###
Bad Login 1 User
    # Attendre l'ecran de chargement
    AppiumLibrary.Wait Until Element Is Visible   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.widget.EditText    240     Chargement trop long, plus de 4min.

    # Appuyer sur le bouton de connexion
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Sleep   3s

    # Vérification d'erreur.
    AppiumLibrary.Wait Until Page Contains   Veuillez corriger les erreurs suivantes     10
    AppiumLibrary.Wait Until Page Contains    Mot de passe requis     10
    AppiumLibrary.Wait Until Page Contains    Adresse email requise   10

Bad Login 2 User
    [Arguments]     ${email}
    # Attendre l'ecran de chargement
    AppiumLibrary.Wait Until Element Is Visible   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.widget.EditText    240     Chargement trop long, plus de 4min.

    # Remplir le login
    AppiumLibrary.Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[3]/android.widget.EditText    ${email}

    # Remplir le mot de passe
    AppiumLibrary.Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[4]/android.widget.EditText   pas le bon :(
    Sleep   1s

    # Appuyer sur le bouton de connexion
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Sleep   3s

    # Vérification d'erreur.
    AppiumLibrary.Wait Until Page Contains   Veuillez corriger les erreurs suivantes     10
    AppiumLibrary.Wait Until Page Contains    Données invalides   10

Bad Login 3 User
    [Arguments]     ${pwd}
    # Attendre l'ecran de chargement
    AppiumLibrary.Wait Until Element Is Visible   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.widget.EditText    240     Chargement trop long, plus de 4min.

    # Remplir le login
    AppiumLibrary.Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[3]/android.widget.EditText    pas_le_bon_:(@deso.com

    # Remplir le mot de passe
    AppiumLibrary.Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[4]/android.widget.EditText   ${pwd}
    Sleep   1s

    # Appuyer sur le bouton de connexion
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Sleep   3s

    # Vérification d'erreur.
    AppiumLibrary.Wait Until Page Contains   Veuillez corriger les erreurs suivantes     10
    AppiumLibrary.Wait Until Page Contains    Données invalides   10

Good Login User
    [Arguments]     ${email}    ${pwd}
    # Attendre l'ecran de chargement
    AppiumLibrary.Wait Until Element Is Visible   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.widget.EditText    240     Chargement trop long, plus de 4min.

    # Remplir le login
    AppiumLibrary.Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[3]/android.widget.EditText    ${email}

    # Remplir le mot de passe
    AppiumLibrary.Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[4]/android.widget.EditText   ${pwd}
    Sleep   1s

    # Appuyer sur le bouton de connexion
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Sleep   4s

    # Vérification de la connexion en regardant le text "Catalogue des sorties"
    ${present}=  Run Keyword And Return Status    AppiumLibrary.Wait Until Page Contains   WHILE USING THE APP     10
    Run Keyword If    ${present}    Close Location Popup
    AppiumLibrary.Wait Until Page Contains      Catalogue des sorties  10

Close Location Popup
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.Button[1]

### Logout ###
Logout User

    # Affiche le menu
    AppiumLibrary.Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[2]    10
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[2]

    # Appuye sur la deconnexion
    AppiumLibrary.Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.view.View[2]/android.widget.ListView/android.view.View[6]   10
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.view.View[2]/android.widget.ListView/android.view.View[6]

    # verifie que l'on arrive sur la page de connexion (verifie qu'il y a bien "Pas de compte ? Créez un compte")
    AppiumLibrary.Wait Until Page Contains      Pas de compte ? Créez un compte  10

### Delete ###
Delete User

    ${newValue}  Set Variable   LIUM
    # Affiche le menu
    AppiumLibrary.Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[2]    10
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[2]

    # Appuye sur "Mes information"
    AppiumLibrary.Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.view.View[2]/android.widget.ListView/android.view.View[1]   10
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.view.View[2]/android.widget.ListView/android.view.View[1]

    # Appuye sur "Supprimer mon compte"
    AppiumLibrary.Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[14]/android.widget.Button     10
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[14]/android.widget.Button

    # Confirmation de la popup pour la suppression
    AppiumLibrary.Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.view.View/android.widget.Button[2]  10
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.view.View/android.widget.Button[2]

    # Vérification de popup
    AppiumLibrary.Wait Until Page Contains    Votre compte a bien été supprimé. Vous allez être déconnecté.   10
    Sleep   6s

Check Delete User

    [Arguments]     ${email}    ${pwd}
    # Attendre l'ecran de chargement
    AppiumLibrary.Wait Until Element Is Visible   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.widget.EditText    240     Chargement trop long, plus de 4min.

    # Remplir le login
    AppiumLibrary.Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[3]/android.widget.EditText    ${email}

    # Remplir le mot de passe
    AppiumLibrary.Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[4]/android.widget.EditText   ${pwd}
    Sleep   1s

    # Appuyer sur le bouton de connexion
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Sleep   4s

    # Vérification d'erreur.
    AppiumLibrary.Wait Until Page Contains   Veuillez corriger les erreurs suivantes     10
    AppiumLibrary.Wait Until Page Contains    Données invalides   10

### Modify ###
Modify User

    ${newValue}  Set Variable   LIUM
    # Affiche le menu
    AppiumLibrary.Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[2]    10
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[2]

    # Appuye sur "Mes information"
    AppiumLibrary.Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.view.View[2]/android.widget.ListView/android.view.View[1]   10
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.view.View[2]/android.widget.ListView/android.view.View[1]

    # Appuye sur "Editer"
    AppiumLibrary.Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[13]/android.widget.Button     10
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[13]/android.widget.Button
    Sleep   1s

    # Remplir la section "Etablisement"
    AppiumLibrary.Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.widget.EditText    10
    AppiumLibrary.Clear Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.widget.EditText
    Sleep   1s
    AppiumLibrary.Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.widget.EditText    ${newValue}
    Sleep   1s

    # Appuye sur "Enregistrer"
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[6]/android.widget.Button[1]
    Sleep   2s

    # Vérifie la modification apportée
    AppiumLibrary.Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[4]/android.widget.Button   10
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[4]/android.widget.Button
    AppiumLibrary.Wait Until Page Contains  ${newValue}  10

### Visualize ###
Visualize User
    [Arguments]    ${email}

    # Affiche le menu
    AppiumLibrary.Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[2]    10
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[2]

    # Appuye sur "Mes information"
    AppiumLibrary.Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.view.View[2]/android.widget.ListView/android.view.View[1]   10
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.view.View[2]/android.widget.ListView/android.view.View[1]

    # Vérifie que dans les information, il y a le bon mail.
    AppiumLibrary.Wait Until Page Contains  ${email}    10
