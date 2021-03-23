# Introduction

## Keycloak

Keycloak est un SSO qui permet de gérer :
* OpenID Connect Support
* OAuth 2.0 Support
* SAML Support
* Social Login (Google, GitHub, Facebook, Twitter etc...)
* User federation : Synchronisation des utilisateurs provenant d'un LDAP et d'un Active Directory
* Kerberos : Retrouve l'utilisateur connecté provenant de Kerberos
* Login flows : Recover passord, verify email, require password update etc...
* Session management
* Token mappers : Informations à mettre dans le JWT
* ...

Keycloak propose pour une console d'administration pour gérer la configuration de l'outil.
Cette configuration est alors stockée dans la base de données de votre choix.


## Concepts de base

Avant de commencer à coder, voici quelques termes utilisés dans ce coding dojo :
* users : Entité capable de se loger sur le SSO (email, username, prénom et autres informations nécéssaires)
* credentials : Mot de passe des utilisateurs
* roles : Rôle permettant d'identifier un type de category d'utilisateur (ADMIN, USER, EXTERNAL-USER etc...)
* realm : Un REALM est un ensemble d'utilisateur, de politique de mot de passe, de rôle et de group. Pour s'authentifier à Keycloak, vous devez forcement appartenir à un des REALM existant
* clients : Un client est une entité qui permet d'authentifier des utilisateurs et qui possède des droits sur le REALM en question (authentifier un user, créer des users, modifier le mot de passe etc ...)
* mappers : Une entité permettant d'ajouter des informations (claims) dans un JWT lors d'une authentification réussie (si vous stocker le numéro de téléphone par ex dans Keycloak, vous pouvez le mapper à votre JWT sous le champ phone_number)
* access token : Un token de type JWT contenant les informations de l'utilisateur en fonction des MAPPER définis. Il permet de retrouver l'utilisateur suite à la génération du TOKEN et est validé par Keycloak afin de vérifier qu'il n'as pas été altéré ou modifier grace à une signature (ex : https://jwt.io)
* refresh token : Un token permettant de générer un nouveau access token avant son expiration (valide pour 15 min par exemple)

