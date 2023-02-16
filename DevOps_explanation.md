# C'est quoi un DevOps?

* C'est un domaine très large
* Tout le monde dit que c'est une intersection entre les Devs et les Ops(SysAdmins).
* Mais quelles sont les frontières à gauche et à droite?
-----------------
## Comprendre le deployement d'une application

* L'objectif c'est de creer une application et faire en sort qu'elle soit disponible pour les clients
* Les étapes de ce processus:

![](https://s3.rezel.net/codimd/uploads/upload_19354c0a13ed1b52974064d3e29549bd.png)


Explication Build and Package: 
* C'est juste prendre le code source et lui transformer en executeble

Explication Deploy it:
* En fait il s'agit de configurer le serveur publique
    * Installer les utils nécessaires
    * Faire turner l'application
    * Configurer le parafeu, etc...

Explication Operete and Monitor:
* Voir si l'application tourne bien
* Si les utilisateurs ont des problèmes avec alle 
* S'elle peut supporter beaucoup de charge

---------------
#### Si tout ça ce passe bien et les clients aiment bien l'application, il aura plus de travail

Il faut:
* Augmenter les fonctionalités
* Réparer les bugs
* Améliorer la performance

Et le plus important: faire en sorte que toutes ces fonctionaliées et amélirations soient disponibles pour les clients le plus vite possible.

------------

#### Soit pour améliorer l'application, soit pour réparer les bugs, il faut refaire le cicle:

![](https://s3.rezel.net/codimd/uploads/upload_1f69082492a9022d9a5d6cf5101d8e9b.png)

Le rôle du DevOps c'est d'augmenter la vitesse de ce processus et minimizer les errors.

C'est à dire, fournir de manière vite des codes de haute qualité.

--------------

## Les défis qui les DevOps doivent résoudre

**1. Améliorer la communications entre les Devs et les SysAdmins**

* Les Devs ecrivent l'application mais les SysAdmins ne peuvent pas la tourner.
* C'est à dire, les Devs ne prendent pas en consideration l'environment que l'application doit tourner.
--------
* Les SysAdmins ne savent pas comment l'application fonctione
* S'il y a un problème, il faut beaucoup de temps pour le résoudre.

----------

**2. Les conflits d'interêt**

* En fait, le but de tous les employées est de fournoir des applications de haute qualité le plus vite possible.
* Par contre, les Devs et les SysAdmins ont des rôles conflitants
* Les Devs veulent deployer des nouvelles fonctionalités le plus vite possible.
* Les SysAdmins veulent assurer la stablitité de l'application et du coup, il ont besoin de diminuer la vitesse pour avoir le temps de s'assurer que tout va être 100% bon.

-------------

**3. Optimizer les processus qui prennent beaucoup de temps**

* Les tests de l'applicaion
    * Nouvelles fonctionnalités
    * Différents environments
    * Performance
    * Sécurité
* Diminuer les travaux manuels
    * Executer commands et scripts dans les serveurs

-------

***DevOps*: Essayent de deployer une application en continuation(CI/CD) et dans une maniére efficace, rapide et automatique.**

