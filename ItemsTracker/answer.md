APP BASIC
Exercice 1:

L'utilisation d'un foreach sur des types primitifs qui ne sont pas conformes au protocole identifiable comme un tableau de chaines ou d'entiers	il es donc nécéssaire d'utiliser:
id: \.self en deuxième paramètre de la liste. 
Cela indique à SwiftUI que chaque valeur du tableau est unique et peut donc être utilisée pour identifier chaque élément de la boucle.

Exercice 2:
On utilise maintenant un foreach car on ne veut pas afficher autant de boutons qu'on a d'éléments dans la liste. on affiche d'abord 1 bouton,
puis apres grace a un foreach tous les éléments qu'on a dans notre liste d'items.
On rajoute également le @State devant notre déclaration de liste pou qu'elle s'actualiser dans notre View.

Exercice 3:
le @State permetra a notre view de reconstruire le composant a chaque fois que notre liste change. Sans celui-ci, l'affichage ne se rafraichit pas.
A présent, a chaque clic, un nouvel élément est rajouté a notre liste. le State détecte donc un changement et notre composant se reconstruit.

AJOUT ITEM
Exercice 1-2:
Cela ne marche pas car notre class n'est pas observable, et notre déclaration de l'objet ne l'es pas non plus, donc le composant ne se met pas a jour.
On rajoute le ObservableObject a notre classe, puis @StateObject a notre objet déclaré pour que le composant puisse se reconstruire au changement de cet objet.
Il faut également rajouter le @Published pour déclarer que la propriété de cet objet est observable et qu'il déclanchera une mise a jour du composant.

ObservableObject est utilisé pour créer des objets dont les propriétés publiées déclenchent automatiquement des mises à jour de l’interface utilisateur lorsqu’elles changent.

StateObject est utilisé pour initialiser un objet observable en tant que propriété d’une vue et garantit que l’objet est créé une seule fois
Ici on peut donc utiliser le StateObject
