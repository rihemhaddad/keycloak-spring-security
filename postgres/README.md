# Keycloak-Postgres

Toutes les données sur les REALM sont stockés dans cette image postgres


## Realm PRIVATE

Utilisé dans le cadre de keycloak-private

La configuration spécifique est la suivante :
* Client 'private-client' est de type confidential avec tous les droits sur le REALM

Utilisateurs pour ce realm :
* jco / password
* jcorha / password
* joo / password

PS : Ne pas toucher les comptes existants, utilisés dans les tests d'intégration

## Realm FRONT

Utilisé dans le cadre de keycloak-front

La configuration spécifique est la suivante : 
* Client 'public-client' est de type public

Utilisateurs pour ce realm :
* front-1 / password
* front-2 / password
* front-3 / password 

## Realm MULTIPLE-1 & MULTIPLE-2 

Utilisé dans le cadre de keycloak-multi-realm  
_Nb: Pour cette partie, X correspond au numéro du realm (1 pour MULTIPLE-1)_

La configuration spécifique est la suivante :
* Client 'multiple-X-client' est de type private avec tous les droits sur le realm respectif

Utilisateurs pour chaque realm :
* multiple-X-1 / password
* multiple-X-2 / password
* multiple-X-3 / password

