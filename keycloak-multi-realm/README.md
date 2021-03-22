# Utilisation des plusieurs REALM privé

## Objectif

Ce projet vise à présenter comment utiliser plusieurs realms au sein d'une même application SPRING.

Pour cela, nous utiliserons l'information au sein du token (champ azp) pour déterminer quel client à générer le token et ainsi retrouver le REALM en question. 

Ceci n'est pas un exercice, juste un exemple de solution.

**Nous vous conseillons de faire / comprendre au préalable l'exercice keycloak-private.** Cet solution complète la configuration mis en place dans cet exercice

## Modification 

Authentification : Lors de l'appel à l'API de login, vous devez préciser le REALM sur lequel se connecté (ou vos RG sur tel format de username correspond à tel REALM etc...)
Création : De même, la création doit préciser le realm en question
Configuration : Pour retrouver l'utilisateur connecté sur les API protégé, nous devons intérroger le bon REALM et valider le token avec les informations associées au realm (cf ci-dessous)

## Configuration

