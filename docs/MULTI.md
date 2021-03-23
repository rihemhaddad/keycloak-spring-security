# Multi REALM 

Dans cet exercice, nous allons voir comment configurer plusieurs REALM sur notre Spring-Security.
Cela permettra de créer des utilsateurs sur ces différents REALM mais aussi de valider le token d'un utilisateur en fonction du REALM qui a permis de générer le JWT


## Configuration

Nous avons déclaré dans notre SecurityConfig un bean de type KeycloakSpringBootConfigResolver. 
Il permet de constuire le KeycloakDeployment qui sera utilisé pour récupérer les informations du REALM et ensuite de valider la signature du token.

Dans l'ordre: 
1. Créer des properties pour faire le lien entre un REALM et un secret (Map<String, String>)
1. Créer un fichier CustomRealmProperties
    * Utiliser @ConfigurationProperties pour lire vos configurations
    * Créer une méthode statique "convertRealmToClient(String realm)": multiple-X => MULTIPLE-X-CLIENT  
    * Créer une méthode statique "convertClientToRealm(String client)" : MULTIPLE-X-CLIENT => multiple-x  
1. Créer une classe qui étend KeycloakSpringBootConfigResolver
    * Surcharger la méthode "resolve(Request request)"
    * Récupérer et parser le token contenu dans le header Authorization
    * Récupérer l'information "issuedFor" ou "azp" (représente le client qui est à l'origine du JWT)
    * Convertir ce client en realm avec votre méthode convertClientToRealm
    * Constuire et retourner un nouvel AdapterConfig avec les 6 informations nécéssaires à la communication avec Keycloak (partir des properties keycloak.*)
1. Remplacer dans le bean KeycloakConfigResolver dans SecurityConfig par votre surcharge

Nous testerons cette configuration plus tard pour les appels API qui nécéssitent une authentification au sein de spring-security

## GET /user

Adapter l'API d'authentification :
1. Ajouter un @RequestParam String realm
1. Convertir le realm en client avec votre méthode statique
1. Récupérer le secret associé à votre REALM en utilisant le fichier CustomRealmProperties et votre map


## POST /user

Dans cette partie, nous avons supprimé l'assignation de rôle pour gagner un peu de temps.
Adapter l'API de création :
1. Ajouter un @RequestParam String realm
1. Modifier la méthode keycloakAsAdmin pour créer une instance de Keycloak pour un REALM donné
1. Créer votre UserResource pour le REALM en question

## PUT /user

Adapter l'API de mise à jour de password:
1. Récupérer l'information du client qui a permis de générer le JWT de la même façon que le username
1. Transformer le en REALM
1. Adapter le reste de la méthode pour interroger le bon REALM

## POST /user/refresh
Adapter l'api de refresh de token :
1. Récupérer les informations sur le realm / clientID provnenant du JWT
1. Adapter l'appel fait via FEIGN pour le bon REALM


## Validation avec tests

Maintenant que votre projet est censé buildé, valider que le comportement est bien celui attendu avec les tests à minima (avec l'interface si vous avez le temps)

