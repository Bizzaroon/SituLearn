*** Settings ***
Documentation  Tests de créations de sorties
Library     Selenium2Library
Library     Collections
Resource    ../../Prerequis.robot
Resource    ../../../Library/FonctionPerso.robot
Resource    SortiesPedagogique/CreerSortie.robot

*** Variables ***

*** Keywords ***
Creer un QCM Avec Réponse
    Connecter situlearnEditor
    Creer balade interactive valide
    