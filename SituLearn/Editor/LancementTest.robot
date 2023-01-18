*** Settings ***
Library          Selenium2Library
Resource         Fonctionnel/Gestion/SortiesPedagogique/CreerSortie.robot
Resource         Fonctionnel/Gestion/SortiesPedagogique/DupliquerSortie.robot
Resource       ./Fonctionnel/Gestion/CompteUtilisateur.robot
Resource    Fonctionnel/Gestion/Filtres/FiltresDomainePedagogique.robot
Test Teardown    Close Browser

*** Test Cases ***

Tout Supprimer
    Connecter situlearnEditor
    Supprimer toutes les activites

Filtres
    # Filtre Domaine Pedagogique Autre
    # Supprimer activite    balade
    # Close Browser

    # Filtre Domaine Pedagogique Decouverte
    # Supprimer activite    balade
    # Close Browser

    # Filtre Domaine Pedagogique Education physique et sportive
    # Supprimer activite    balade
    # Close Browser

    # Filtre Domaine Pedagogique Geographie
    # Supprimer activite    balade
    # Close Browser

    # Filtre Domaine Pedagogique Histoire
    # Supprimer activite    balade
    # Close Browser

    Filtre Domaine Pedagogique Musee
    Supprimer activite    balade
    Close Browser

    Filtre Domaine Pedagogique SVT
    Supprimer activite    balade
    Close Browser

