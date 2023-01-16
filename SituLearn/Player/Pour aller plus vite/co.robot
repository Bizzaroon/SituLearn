*** Settings ***
Resource         ../Prerequis.robot
Resource         ../Fonctionnel/Gestion/CompteUtilisateur/connexion.robot

*** Test Cases ***
User Test
    Open SituLearnPlayer
    Good Login Test  SitulearnTestPlayer@gmail.com    SituLearn