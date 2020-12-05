# React

React est une bibliothèque JavaScript déclarative, efficace et flexible pour construire des interfaces utilisateurs (UI). Elle vous permet de composer des UI complexes à partir de petits morceaux de code isolés appelés « composants ».

## Initialiser le projet

### Prérequis

* NodeJS

> vous pouvez vérifier que node est bien installé avec la commande 
>
> ```
> node --version
> ```

* NPM (normalement installé avec node)

### Créer le projet 

```
npm install -g create -react-app
npx create-react-app NOMDEMONAPP
cd NOMDEMONAPP
npm start
```

### En cas de soucis 

```
npm cache verify
npm install -g create -react-app
```

## React.Component

Nous allons commencer avec un composant simple react.

```react
class ShoppingList extends React.Component {
  render() {
    return (
      <div className="shopping-list">
        <h1>Liste de courses pour {this.props.name}</h1>
        <ul>
          <li>Instagram</li>
          <li>WhatsApp</li>
          <li>Oculus</li>
        </ul>
      </div>
    );
  }
}

// Exemple d’utilisation : <ShoppingList name="Marc" />
```

Un composant accepte les paramètres suivants : 

* props : propriétés à envoyer à l'objet
* render : arborescence de vues à afficher



```react
class Square extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      value: null,
    };
  }

  render() {
    return (
      <button
        className="square"
        onClick={() => this.setState({value: 'X'})}
      >
        {this.state.value}
      </button>
    );
  }
}
```

```react
class Square extends React.Component {
  render() {
    return (
      <button
        className="square"
        onClick={() => this.props.onClick()}
      >
        {this.props.value}
      </button>
    );
  }
}

class Board extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      squares: Array(9).fill(null),
    };
  }

  handleClick(i) {
    const squares = this.state.squares.slice();
    squares[i] = 'X';
    this.setState({squares: squares});
  }

  renderSquare(i) {
    return (
      <Square
        value={this.state.squares[i]}
        onClick={() => this.handleClick(i)}
      />
    );
  }

  render() {
    const status = 'Prochain joueur : X';

    return (
      <div>
        <div className="status">{status}</div>
        <div className="board-row">
          {this.renderSquare(0)}
          {this.renderSquare(1)}
          {this.renderSquare(2)}
        </div>
        <div className="board-row">
          {this.renderSquare(3)}
          {this.renderSquare(4)}
          {this.renderSquare(5)}
        </div>
        <div className="board-row">
          {this.renderSquare(6)}
          {this.renderSquare(7)}
          {this.renderSquare(8)}
        </div>
      </div>
    );
  }
}
```



## Key pour les listes

Bien penser 

```react
<li key={user.id}>{user.name} : {user.taskCount} tâches restantes</li>
```

