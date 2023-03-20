#Dans ce fichier on retrouve les différents tests sur les activités (QCM, etc.)

*** Settings ***
Documentation  Tests de créations de sorties
Library     Selenium2Library
Library     Collections
Resource    ../../Prerequis.robot
Resource    ../../../Library/FonctionPerso.robot
Resource    SortiesPedagogique/CreerSortie.robot

*** Keywords ***
Creer un QCM Avec Réponse
    Connecter situlearnEditor
    Creer balade interactive valide
    