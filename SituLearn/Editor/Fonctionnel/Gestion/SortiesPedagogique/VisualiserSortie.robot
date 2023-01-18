*** Settings ***
Documentation  Tests de créations de sorties
Library     Selenium2Library
Library     Collections
Resource    ../../../Prerequis.robot
Resource    CreerSortie.robot
Resource    ../../../../Library/FonctionPerso.robot

*** Keywords ***
Visualiser les Sorties Pédagogique du concepteur
    Creer balade interactive valide
    Redirection page d'acceuil

Visualiser les sorties pédagogiques
    Connection situlearnEditor  testsitulearn2@gmail.com  testsitulearn
    Creer balade interactive valide
    Deconnection situlearnEditor
    Connection situlearnEditor  testsitulearn@gmail.com  TestSituLearn1234
    Creer balade interactive valide
    Deconnection situlearnEditor
    