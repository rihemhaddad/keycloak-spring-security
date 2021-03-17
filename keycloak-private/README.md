# Utilisation d'un REALM privé

## Objectif

L'objectif de cet exercice est d'utiliser un REALM Keycloak en ayant un client de type "SUPER-ADMIN".
Ce client aura tous les droits sur le REALM et pourra faire toutes les actions nécéssaires sur les utilisateurs de ce REALM.

**Cette solution est à utiliser uniquement depuis votre BACK-END**. 
Il ne faut pas utiliser ce client Keycloak depuis le FRONT-END, cela donnerait tous les droits sur votre Keycloak à un utilisateur mal-intentionné avec les informations disponibles (clientId, clientSecret)

## Etapes de réalisation

Pour présenter cette solution, nous procéderons par étape : 
1. Mise en place de la configuration Spring
2. GET /user
3. POST /user
4. PUT /user
5. POST /user/refresh

Mise à part pour la première étape, nous fonctionnerons en Test-Driven Development (TDD). 
Les tests vous sont fournis et vous devrez respecter la signature des API proposées.

_NB :Le service propose de base une page /index.html qui vous permet de tester les API_ 

## Setup configuration

Avant de développer des API sécurisés grâce à Keycloak, il faut mettre en place la configuration de sécurité.
Pour cela nous vous conseillons de jeter un oeil à : [6.2 Configuration Class uniquement](https://www.baeldung.com/spring-boot-keycloak#securityconfig)

En quelques mots sur les différentes classes utilisées : 
* KeycloakWebSecurityConfigurerAdapter : Classe qu'on étant pour créer un WebSecurityConfigurer sécurisé par Keycloak (créé les filtres nécéssaires, la config du http etc ...).
* KeycloakAuthenticationProvider : Performs authentication on a KeycloakAuthenticationToken
* KeycloakSpringBootConfigResolver : Définit la manière dont chaque requête va permettre de construire un object pour communiquer avec keycloak (KeycloakDeployment, en lien avec AdapterConfig / KeycloakSpringBootProperties de base les properties que vous mettez dans keycloak.*)
* RegisterSessionAuthenticationStrategy : Définit la manière dont les utilisateurs seront stockés en cache après une authentification réussie.


**Exercice:**
Récupérer cette classe dans votre projet spring mis à votre disposition.

1. Ajouter l'annotation permettant d'utilser les annotation @PreAuthorize dans votre projet sur chaque API
2. Remplacer le Bean SessionAuthenticationStrategy par NullAuthenticatedSessionStrategy et essayer de comprendre la différence / les impacts sur un projet de PROD
3. Ajouter les properties nécéssaire pour le fonctionnement du starter-keycloak (URL, client ...)

## GET /user

Pour requêter Keycloak, nous vous montrons deux solutions :
* OpenFeign : Vous définissez votre client Feign avec les différentes signatures d'API à utiliser (OpenFeign est un builder de requête, le RestTemplate de spring s'occupe d'executer les requêtes ensuite)
  * (+) Plus simple d'utilisation
  * (-) Suivre les montées de version keycloak pour voir les potentiels changement de signature des API
  
* KeycloakAdmin : Client JAVA exposé par Keycloak pour requêter les différentes API pour une release donnée
  * (+) Pas de problème de signature car la version est liée à une release donnée de Keycloak
  * (-) Utilisation d'un client HTTP différent de celui de Spring (RestEasyClient si < 3.7, probleme de finalize en JVM)  
    
    
**Exercice:**
1. Trouver l'API permettant de générer des tokens et les informations nécéssaires à envoyer à cette API. Pour vous aider : `curl -http://localhost:8080/auth/realms/PRIVATE/.well-known/openid-configuration`
2. Compléter le KeycloakClient.java pour ajouter l'API permettant de récupérer un token
3. Compléter le UserController.login pour permettre à un utilisateur de récupérer un AccessTokenResponse

Pour valider votre 3ème étape: 
* Lancer l'appli et tester avec un des utilisateurs existants
* Lancer uniquement le test shouldLogin

Docs :
* https://github.com/keycloak/keycloak-documentation/blob/master/securing_apps/topics/oidc/oidc-generic.adoc
* https://openid.net/specs/openid-connect-core-1_0.html#TokenEndpoint


## POST /user

Nous allons utiliser la librairie KeycloakAdmin pour cette API.
L'objectif est d'exposer une API pour créer un utilsateur dans Keycloak puis d'assigner un rôle à cette utilisateur.
En effet, les REALM permettent d'avoir des roles par défault à la création. Néanmoins, il est plus simple de gérer plusieurs rôles que plusieurs REALM avec chacun un rôle par défault.


**Exercice:**
1. Trouver comment utiliser la UsersResource pour créer votre utilisateur (comprendre l'object Keycloak utilisé dans RestEasyClient)
2. Gérer les éventuelles erreurs sur la réponse de Keycloak
3. Trouver et assigner le rôle "PRIVATE_USER" sur l'utilisateur créé

Docs :
* https://javadoc.io/doc/org.keycloak/keycloak-admin-client/latest/index.html

Test associé: 
* shouldCreate

## PUT /user

Cette API permet de mettre à jour son mot de passe pour un utilisateur connecté.
Nous vous conseillons d'utiliser le mode DEBUG de votre IDE & la page index.html pour envoyer votre token, quel type d'objet est dans le contexte spring security etc ...

**Exercice:**
1. Récupérer le username de l'utilisateur présent dans le token / contexte spring security (interdiction d'utiliser un @Header, vous devez utiliser les mécaniques spring security !)
2. Mettre à jour le mot de passe de l'utilsateur avec le KeycloakAdmin de préférence

Reflection : Sur l'un de vos projets, comment feriez-vous pour verifier un ancien mot de passe ?

Tests associés : 
* shouldUpdatePassword
* shouldDenyApi


## POST /user/refresh

Cette API permet de mettre à jour un token d'accès avant expiration.
De base l'AccessTokenResponse contient :
* access_token qui représente votre JWT
* refresh_token qui permet de générer un nouveau JWT 

**Exercice:**
1. Réutiliser votre API Feign créée pour la connexion, pour raffraichir un token

Test associé :
* shouldLoginAndRefresh
