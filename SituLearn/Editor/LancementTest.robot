*** Settings ***
Library          Selenium2Library
Resource         Fonctionnel/Gestion/SortiesPedagogique/CreerSortie.robot
Resource         Fonctionnel/Gestion/SortiesPedagogique/ModifierNomSortie.robot
Resource         Fonctionnel/Gestion/SortiesPedagogique/ModifierNomSortieVide.robot
Resource         Fonctionnel/Gestion/SortiesPedagogique/VisibiliteSortie.robot
Resource         Fonctionnel/Gestion/SortiesPedagogique/SupprimerSortie.robot
Resource         Fonctionnel/Gestion/SortiesPedagogique/DupliquerSortie.robot
Resource       ./Fonctionnel/Gestion/CompteUtilisateur.robot
Test Teardown    Close Browser

*** Test Cases ***
#CreerSortie
#    Creer chasse au trésor valide
#    Creer hub d'activité valide
#    Creer balade interactive valide
#
#ModifierNomSortieValide
#    Modifier balade interactive valide
#
#ModifierNomSortieInvalide
#    Modifier nom sortie vide
#
#VisibiliteSortie
#    Publier une sortie Pédagogique Complète
#

Dupliquer Sortie
    Dupliquer Sortie

#Connection situlearnEditor
#    Connection situlearnEditor  testsitulearn@gmail.com  TestSituLearn1234

#Deconnection situlearnEditor
#    Deconnection situlearnEditor

#Modifier profil prénom
#    Modifier profil prénom  Marc

#Modifier profil nom
#    Modifier profil nom  Martin

#Créer puis supprimer une sortie
#    Creer balade interactive valide
#    Supprimer une sortie  balade

#Modifier profil prénom vide
#    Modifier profil prénom vide