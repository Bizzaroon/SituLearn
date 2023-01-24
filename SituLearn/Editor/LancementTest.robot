*** Settings ***
Library          Selenium2Library
Resource         Fonctionnel/Gestion/SortiesPedagogique/CreerSortie.robot
Resource         Fonctionnel/Gestion/SortiesPedagogique/DupliquerSortie.robot
Resource         Fonctionnel/Gestion/CompteUtilisateur.robot
Resource         Fonctionnel/Gestion/UnitesDeJeu.robot
Resource         Fonctionnel/Gestion/Filtres/FiltresDomainePedagogique.robot
Test Teardown    Close Browser

*** Test Cases ***

Supprimer toutes les sorties
    Connecter situlearnEditor
    Supprimer toutes les activites

Filtre Autre
    Filtre Domaine Pedagogique Autre

Filtre Decouverte
    Filtre Domaine Pedagogique Decouverte

Filtre Education physique et sportive
    Filtre Domaine Pedagogique Education physique et sportive

Filtre Geographie
    Filtre Domaine Pedagogique Geographie

Filtre Histoire
    Filtre Domaine Pedagogique Histoire

Importer unite de jeu
    Importer une unité de jeu
    

