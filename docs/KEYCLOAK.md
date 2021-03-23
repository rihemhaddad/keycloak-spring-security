# Configuration de Keycloak

Pour aller plus loin et terminer cette présentation de l'outil, nous allons vous faire configurer Keycloak.

**Objectif : Recréer les REALMS PRIVATE & FRONT des exercices précedent.**

Comme nous l'avons vu, les configurations sont stockées dans une base de données.

## Suppression des configurations

Avant de commencer, remplacer dans le docker-compose.yml racine :
```yml
version: '3'

services:
  postgres:
    image: postgres:12-alpine
    container_name: postgres_test
    environment:
      POSTGRES_DB: keycloak
      POSTGRES_USER: keycloak
      POSTGRES_PASSWORD: keycloak

  keycloak:
    image: jboss/keycloak:12.0.4
    container_name: keycloak
    environment:
      DB_ADDR: postgres
      DB_PORT: 5432
      DB_DATABASE: keycloak
      DB_SCHEMA: public
      DB_USER: keycloak
      DB_PASSWORD: keycloak
      # Permet de créer un utilisateur au lancement de keycloak
      KEYCLOAK_USER: admin
      KEYCLOAK_PASSWORD: Password7!
    depends_on:
      - postgres
    ports:
      - 8080:8080
```

Relancer votre configuration :

```shell
docker-compose down && docker-compose up -d postgres && docker-compose up -d keycloak
```

Visitez et connectez vous sur http://localhost:8080/.

Si tout est bon, vous ne devez voir qu'un seul REALM : MASTER (celui de l'administration de Keycloak)

## FRONT

Pour recréer le REALM FRONT, suivez les étapes dans l'ordre : 
1. Ajouter un REALM FRONT
1. Ajouter le client "public-client" de type openid-connect sans root URL
1. Ajouter une Valid redirect URI de votre client. Il s'agit de l'URL ou vous allez être redirigé après une authentification
1. Ajouter un utilisateur avec un mot de passe

De base, votre realm est de type public (Dans settings du client => Access type = public)

Tester votre configuration !

## PRIVATE
Pour recréer le REALM PRIVATE, suivez les étapes dans l'ordre :
1. Ajouter un REALM PRIVATE
1. Ajouter le client "private-client" de type openid-connect sans root URL
1. Ajouter une Valid redirect URI de votre client. Il s'agit de l'URL ou vous allez être redirigé après une authentification
1. Changer le Access type en "confidential"
1. Cocher "Service Accounts Enabled"
1. Cocher "Authorization Enabled"
1. Aller dans l'onglet Credential de votre client. Intégrer le secret dans votre configuration SPRING
1. Ajouter tous les droits sur le REALM à votre client
1. Ajouter un utilisateur avec un mot de passe

Tester votre configuration !

## Fonctionnalitées supplémentaires

Pour ceux qui veulent découvrir la puissance des features Keycloak, voici quelques configuration à tester sur le REALM Private :
1. Définissez une politique de mot de passe dans votre REALM (Authentication): 
    * 8 caractères minimum
    * 1 caractère spécial
    * 1 caractère en UPPER
    * 1 caractère en lower
    * 1 chiffre
1. Désactiver le fallback d'authentification avec l'email (Realm Settings) et ne pas permettre deux utilisateurs d'avoir le même mail au sein d'un même REALM
1. Changer la durée de vie des JWT à 5 min (Realm Settings)
1. Ajouter un mapper sur votre client pour ajouter l'attribut phone_number des utilisateurs dans le JWT
    * Créer ensuite un utilisateur
    * Allez dans l'onglet attributes de cet utilisateur
    * Ajouter un champ phone_number avec une valeur définit
    * Tester une authentification et valider que vous voyez bien le champs dans le JWT (https://jwt.io pour lire les tokens)
1. Ajouter un rôle par défault à tous vos utilisateurs (USER par exemple). Verifier la présence de ce rôle dans le JWT sur un nouvel utilisateur créé (ne rajoute pas sur les utilisateurs existants !!)
