Ex 2: E-Commerce
================

L'objectif est de créer un modèle objet et relationnel pour un système de e-commerce.

Voici les tables/champs (sans les relations) de la base de donnée:

clients
:   firstname
:   lastname

products
:   name
:   price
:   description

categories
:   name
:   description

orders
:   created_at
:   shipped_at
:   status

order_items
:   quantity
:   item_price

:heavy_check_mark: Exigence 0   
----------
La base de donnée est correctement configurée. 
Il est possible de le vérifier en effectuant un test avec la commande :
```cmd
rake db:migrate
```
Puis en observant les données apparaître dans la DB.

:heavy_check_mark: Exigence 1
----------

Créez la BD selon les spécifications précédentes en ajoutant aussi les clés étrangères selon la convention de
nommage de ActiveRecord.

Crééz les classes ActiveRecord pour chacune de ces entités avec les **associations**.


:heavy_check_mark: Exigence 2
----------

Afin de prouver que vos classes et leurs associations fonctionnent, vous allez:

  - Créez ...


 🛠️ Exigence 3
----------

Ajoutez les *scopes* suivants:

  - Sur `Product`: `cheap` qui permet de sortir les produits dont le prix est de -.20 ou moins
  - Sur `OrderItem`: `bulk` qui permet de sortir les items qui ont été commandé avec une quantity
    de 100 pièces ou plus. Ce scope acceptera un paramètre qui est le seuil du nombre de pièces.
    Comme indiqué par défaut c'est 100 pièces.

Ensuite, faites en sorte que le programme principal affiche pour un client donné, les produits
pas cher qu'il a commandé.
Pour ceci, ajouter du code là où il vous semble le mieux placé.

De plus affichez les produits commandé par quantité de plus de 50 pièces.

:heavy_check_mark: Exigence 4
----------

La cohérence des données dans la BD est importante, vous allez donc ajouter des règles
de validations:

  - Un client doit avoir un prénom et un nom (pas trop court)
  - Une commande ne peut être passée que si:
    - il y a au moins un produit commandé

 :heavy_check_mark: Exigence 5
----------

Lors d'une commande, le but est d'afficher le prix total de la commande.
Ajoutez le code nécessaire afin d'obtenir ce prix total.

Faites en sorte que le prix du produit soit copié dans `item_price` de `OrderItem` pour bien avoir
le prix du produit lors de la commande.

Le but est d'ajouter le code pour ces fonctionnalités aux bons endroits!


:heavy_check_mark: Exigence 6
----------

Les clients sont de deux types différents:

  - Les particuliers
  - Les entreprises

Adaptez votre code pour prendre en compte ce changement.


:heavy_check_mark: Exigence 7
----------

Notre plateforme évolue vers un système d'échange B2B, il faut donc ajouter
la notion de Fournisseur.

Chaque produit est lié à un fournisseur.
Il sera possible de lister les catégories couvertes par chaque fournisseur.


:heavy_check_mark: Exigence 8
----------

Le système devient *social*, nos utilisateurs veulent donc pouvoir poster
des commentaires sur:

  - Les produits
  - Les fournisseurs

Ajoutez les tables, les modèles et les associations.


:mag: Exigence 9
----------

Le système envoie un mail lorsque le nombre de pièces de chaque produit en stock arrive en dessous de 5 pièces.

---

 🛠️ Exigence A
----------


Maintenant que le système complet de gestion est en place, nous allons ajouter des opérations de traitement.

1. Afficher la commande la plus cher
2. Afficher les catégories qui n'ont jamais été commandées
3. Supprimer les clients n'ayant fait aucune commande
4. Déterminer s'il y a des commandes ou non entre deux dates données

