*** Settings ***
Resource         Prerequis.robot
Resource         Fonctionnel/Gestion/CompteUtilisateur.robot
Resource         Fonctionnel/Gestion/Notification.robot
Test Teardown    Close Application

*** Variables ***
${email}    SitulearnTestPlayer@gmail.com
${pwd}      SituLearn

*** Test Cases ***

Test de Mauvaise Connexion 1
    Open SituLearnPlayer
    Bad Login 1 User

Test de Mauvaise Connexion 2
    Open SituLearnPlayer
    Bad Login 2 User    ${email}

Test de Mauvaise Connexion 3
    Open SituLearnPlayer
    Bad Login 3 User    ${pwd}


Test de Connexion
    Open SituLearnPlayer
    Good Login User  ${email}    ${pwd}

Test de Visualisation de son Compte Utilisateur
    Connecter SituLearn Player
    Visualize User  ${email}
    
Test de Modification de son Compte Utilisateur
    Connecter SituLearn Player
    Modify User

Test de Déconnexion
    Connecter SituLearn Player
    Logout User

# Je met en commentaire ses lignes car si on les automoatise le compte sera supprimé et il faudra le recrée à chaque fois (il y a un captcha lors de la creation).
# Test de Suppression de son Compte Utilisateur
#     Connecter SituLearn Player
#     Delete User
#     Check Delete User   ${email}    ${pwd}


Notifier une Proximité d’un POI
    Connecter SituLearn Player
    Notifier une Proximité d’un POI Valide