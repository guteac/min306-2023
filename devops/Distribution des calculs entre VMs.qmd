# Distribution des calculs entre VMs

## Introduction

Cet article va montrer comment créer un cluster pour parallélisation des calculs dans un petit code écrit en python. Il a pour but faire une démonstration pour explorer la procédure et comprendre son fonctionnement général.

## Création du cluster 

Pour faire le cluster l'utile VirtualBox a été utilisé. Il permet de créer des virtual machines(VMs) en utilisant les ressources disponibles dans votre ordinateur.

Pour qui la démonstration soit plus claire, 3 VMs [lubuntu](https://lubuntu.me/) ont été crées et comme ça, les calculs faits par le code seront distribués entre trois nodes différents.

La configuration des VMs n'est pas du tout robuste. Il suffit de réserver 1 Go de RAM et 10Go de stockage pour que chacune puisse bien marcher et que votre ordinateur ne soit pas surchargé.

Elles vont être liées à un réseau privé qui a été crée avant le deployment des VMs.

## Instalation de Dask

**Warning:** Pour que tout marche bien, il faut s'assurer que les nodes(VMs) ont les mêmes versions de Python, Dask et de toutes les bibliothèques qui seront utilisées pendant l'exécution du code.

Aprés l'instalation de Python et de [pip](https://pip.pypa.io/en/stable/installation/), la prochaine étape est d'installer [Dask](https://www.dask.org/). Il s'agit d'une librarie python utilisée pour paralléliser les calcules faits par le code.

Pour chaque utilisation du code en Python(for loops, pasndas, numpy), Dask propose une [façon](https://tutorial.dask.org/00_overview.html) différente d'organiser le code pour qu'il soit parallélisé d'une manière interpretable pour Dask.

Aprés que Dask est instalé dans les trois nodes en suivant ce [tutoriel](https://docs.dask.org/en/stable/install.html),on peut déjà passer à l'organisation du cluster pour que le calcule soit bien distribué.

## Utilisation de Dask

Dans l'organisation du cluster, on doit définir quels seront les nodes responsables pour faire le calcule et quel va être le master node responsable pour distribuer les tâches. C'est important de savoir que le master node peut être un worker node au même temps.

Pour définir le master node, il faut juste taper la commande ```dask scheduler``` dans un terminal et ```dask worker IP:8786``` dans un autre pour quelles soit aussi un worker si vous voulez comme ça. L'IP c'est celui de la VM(dans le réseau local créé précédemment) qui travaille comme master(dans ce cas c'est l'IP de cette VM).

Pour qui les autres VMs soient configurées comme workers il faut suivre une procédure similaire, avec l'ouverture d'un terminal et la commande ```dask worker IP:8786``` en utilisant l'IP de la VM qui travaille comme scheduler.

## Résultats

Pour voir la performance du système on va utiliser un code fournit dans le site de Dask. Dans une situation sans distribution des calculs, il peut-être écrit comme ça:

```
def inc(x):
    sleep(1)
    return x + 1


results = []
for x in data:
    y = inc(x)
    results.append(y)

total = sum(results)
print(total)
```

Mais pour qu'il soit [adapté](https://tutorial.dask.org/03_dask.delayed.html) à l'utilisation de Dask, on doit l'exécuter avec la forme suivante:

```
@dask.delayed
def inc(x):
    sleep(1)
    return x + 1


results = []
for x in data:
    y = inc(x)
    results.append(y)

total = sum(results)
result = total.compute()
print(result)
```
Pour vérifier la performance, ce deuxième code doit être lancé dans le master node.

Le premièr code, sans parallélisme, prend 8 secondes pour être exécuté totalement.

**Astuce:** Pour voir le temps d'exécution du code, il faut rajouter ```time``` avant de la commande pour lancer le fichier Python.

Alors que le code qui utilise Dask a des temps d'exécution différents si on varie la quantité de worker qui sont responsables pour calculer le code.
Voici un graphique qui montre les différents temps d'exécution de ce code en fonction de la quantité de nodes utilisée:

![](https://s3.rezel.net/codimd/uploads/upload_0472057e55267666df122b194bd0ed9b.png)

Donc on peut voir que ce graphique n'est pas linéaire et cette constatation c'est vraiment important dans un cas d'une implémentation dans un grand cluster. Il faut trouver donc le point optimal entre le prix des ressources utilisées(Mémoire vive et stockage) et les bienfaits concernant le temps d'exécution du code.