*** Settings ***
Library          Selenium2Library
Resource         Fonctionnel/Gestion/SortiesPedagogique/CreerSortie.robot
Resource         Fonctionnel/Gestion/SortiesPedagogique/DupliquerSortie.robot
Resource         Fonctionnel/Gestion/CompteUtilisateur.robot
Resource         Fonctionnel/Gestion/UnitesDeJeu.robot
Resource         Fonctionnel/Gestion/Filtres/FiltresDomainePedagogique.robot
Test Teardown    Close Browser

*** Test Cases ***

Tout Supprimer
    Connecter situlearnEditor
    Supprimer toutes les activites

Filtres
    Filtre Domaine Pedagogique Autre

    Filtre Domaine Pedagogique Decouverte

    Filtre Domaine Pedagogique Education physique et sportive

    Filtre Domaine Pedagogique Geographie

    Filtre Domaine Pedagogique Histoire

    Filtre Domaine Pedagogique Musee

    Filtre Domaine Pedagogique SVT

Importer unite de jeu
    Importer une unité de jeu
    

