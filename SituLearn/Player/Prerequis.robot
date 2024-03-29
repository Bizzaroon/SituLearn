*** Settings ***
Library     AppiumLibrary
Library     RPA.Windows

Resource    Fonctionnel/Gestion/CompteUtilisateur.robot
Resource    ./Fonctionnel/Variables.robot

*** Variables ***
${REMOTE_URL}   http://localhost:4723/wd/hub
${appium:deviceName}    emulator-5554
${appium:platformName}    android
${appium:platformVersion}    11
${appium:appPackage}    org.chromium.webview_shell
${appium:appActivity}    org.chromium.webview_shell.WebViewBrowserActivity
${appium:newCommandTimeout}    3600
${appium:connectHardwareKeyboard}    true

*** Keywords ***

#Mise en place, lance le serveur appium Appium
Mise en Place
    Windows Run    emulator ${emulator}
    sleep  20s
    Windows Run    Appium
    Sleep  10s
    
Reload Page
    # Redirige vers l'URL mis
    AppiumLibrary.Click Element    accessibility_id=Load URL

Open SituLearnPlayer
    #Ouvre la WebView
    Open Application    ${REMOTE_URL}   appium:deviceName=${appium:deviceName}  appium:platformName=${appium:platformName}  appium:platformVersion=${appium:platformVersion}  appium:appPackage=${appium:appPackage}  appium:appActivity=${appium:appActivity}  appium:newCommandTimeout=${appium:newCommandTimeout}  appium:connectHardwareKeyboard=${appium:connectHardwareKeyboard}
    Sleep   1s
    
    # Remplie l'URL avec "https://situlearn-player.univ-lemans.fr"
    Clear Text    id=org.chromium.webview_shell:id/url_field
    AppiumLibrary.Input Text    id=org.chromium.webview_shell:id/url_field    https://situlearn-player.univ-lemans.fr
    Reload Page

Connecter SituLearn Player
    Open SituLearnPlayer
    Good Login User  SitulearnTestPlayer@gmail.com    SituLearn
