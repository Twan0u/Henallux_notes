## Chapitre 8 : Programmation Evénementielle

Voici les éléments les plus communs du DOM

### 8.1 Types D'événements

#### 8.1.1 Evènements de souris

* click,
* dblclick, 
* mousedown, 
* mouseup, 
* mouseover, 
* mouseout 

#### 8.1.2 Evènements de clavier

keypress, keydown, keyup

#### 8.1.3 Evènements généraux

* load (quand le document / une image est entièrement chargé)
* error, 
* resize, 
* scroll, 
* unload 
* …

#### 8.1.4 Evènements de type formulaire

* blur, focus (perte et gain de focus), 
* select (sélection d'un bout de texte dans un champ), 
* change (modification), 
* submit (bouton "soumettre"), 
* reset

### 8.2 Lier une action à un événement

#### 8.2.1 Dans le code HTML

```html
<button onclick="action();">Click</button>
```

#### 8.2.2 Ajouter dynamiquement via Javascript

```javascript
but.addEventListener("click", action);
```

Ici click est le type d'événement et action est l'action exécutée (fonction)

