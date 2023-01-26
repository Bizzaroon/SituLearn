*** Settings ***
Library          Selenium2Library
Resource         Fonctionnel/Gestion/SortiesPedagogique/CreerSortie.robot
Resource         Fonctionnel/Gestion/SortiesPedagogique/DupliquerSortie.robot
Resource         Fonctionnel/Gestion/CompteUtilisateur.robot
Resource         Fonctionnel/Gestion/UnitesDeJeu.robot
Resource         Fonctionnel/Gestion/Filtres/FiltresDomainePedagogique.robot
Resource         Fonctionnel/Gestion/SortiesPedagogique/ModifierSortiePedagogique.robot
Resource         Fonctionnel/Gestion/SortiesPedagogique/TesterSortie.robot
Resource    Fonctionnel/Gestion/SortiesPedagogique/VisibiliteSortie.robot
Resource    Fonctionnel/Gestion/SortiesPedagogique/VisualiserSortie.robot
Test Teardown    Close Browser

*** Test Cases ***

# Partie Sorties Pédagogiques
Créer une Unité De Jeu Valide pour chasse au trésor
    Creer unite de jeu chasse au trésor

Créer une Unité De Jeu Valide pour balade interactive
    Creer unite de jeu balade intérative

Créer une Unité De Jeu Valide pour hub d'activite
    Creer unite de jeu hub d'activite

Dupliquer une Sortie
    Dupliquer Sortie

Modifier le Nom d'une Sortie
    Modifier nom sortie vide

Modifier une Balade Interactive 
    Modifier balade interactive valide

Modifier une Chasse au Trésor
    Modifier chasse au trésor valide

Modifier un Hub d'Activite
    Modifier hub d'activite valide

Supprimer une Sortie Pédagigique
    Supprimer une sortie

Tester une Sortie Pédagigique
    Tester Sortie

Publier une Sortie Pédagogique
    Publier une sortie Pédagogique Complète

Masquer une Sortie Pédagogique
    Masquer une sortie pedagogique

Rendre Visible une Sortie Pédagogique
    Rendre visible une sortie pedagogique

Visualiser les Sorties Pédagogique du Concepteur
    Visualiser les Sorties Pédagogique du concepteur

Visualiser les Toutes Sorties Pédagogiques
    Visualiser les sorties pédagogiques


# Partie Unité de jeu
Importer Unité de Jeu
    Importer une unité de jeu


# Partie Filtre de Recherche
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

Filtre Musée
    Filtre Domaine Pedagogique Musee

Filtre SVT
    Filtre Domaine Pedagogique SVT
    

