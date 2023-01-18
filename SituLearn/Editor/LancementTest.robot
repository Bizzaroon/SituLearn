*** Settings ***
Library          Selenium2Library
Resource         Fonctionnel/Gestion/SortiesPedagogique/CreerSortie.robot
Resource         Fonctionnel/Gestion/SortiesPedagogique/ModifierNomSortie.robot
Resource         Fonctionnel/Gestion/SortiesPedagogique/ModifierNomSortieVide.robot
Resource         Fonctionnel/Gestion/SortiesPedagogique/VisibiliteSortie.robot
Resource         Fonctionnel/Gestion/SortiesPedagogique/SupprimerSortie.robot
Resource         Fonctionnel/Gestion/SortiesPedagogique/DupliquerSortie.robot
Resource       ./Fonctionnel/Gestion/CompteUtilisateur.robot
Resource    Fonctionnel/Gestion/Filtres/FiltresDomainePedagogique.robot
Test Teardown    Close Browser

*** Test Cases ***
Filtres
    Filtre Domaine Pedagogique Education physique et sportive
    Supprimer activite    balade