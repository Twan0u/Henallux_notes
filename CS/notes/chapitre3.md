# 3 Coder en c#

## 3.1 Les variables

Un attribut commence par une **minuscule** et fait maximum 511 char (alphaNum, accents, 'ç', Mu et '\_'). par défaut, chaque attribut standard est initialisé à 0 du type.

Le Framework .NET comprends beaucoup de types prédéfinis, nottament des alias et un type décimal qui retiens les chiffres des nombres avec une décimale importante (vs approximation binaire des autres types)

On différencie aussi les classes et les structures dans l'écriture et la gestion de la mémoire.

Contrairement en java, en C#, les uint32 et les int ne sont pas deux entités similaires mais des synonymes.

Les strings ou Strings sont aussi synonymes. Ils peuvent être comparés entre eux via l'utilisation de '==' contrairement au java. On peut ainsi les comparer car le C# authorise la redéfinition des méthodes usuelles (ex: ToString) mais aussi des comparaisons '==', '+' ou '\*'. 

On peut définir une variable entière comme suit :

``` cs
int nom_variable; // variable entière
string nom_variable; // variable texte
bool nom_variable; // variable boolenne true/false
decimal nom_variable; // variable qui retiens les décimaux (nécéssaire quand on traite avec de l'argent)

// mettre une valeur dans une variable
nom_variable = 10;
nom_variable++;//ajoute 1
nom_variable--;//retire 1
nom_variable+=2;//équivalent à var= var+2
nom_variable-=2;//idem suppra
nom_variable/=2; //idem suppra
```

> \>string.Empty est équivalent à "".

On peut concaténer des strings avec l'opérateur +, '\' est le caractère d'échapement et il permets nottament d'écrire :

``` cs
string tabulation = "\t";
string retourLigne = "\n";
string slash = "\\";
string slash = @"\"; // le @ évite de devoir écrire le double slash
```


## 3.2 Conditions

### 3.2.1 IF

``` cs
if (cond){}
else if(cond){}
else{}
```

### 3.2.2 Switch

``` cs
switch (variable){
    case 1: // si la variable variable vaut 1 on exécute le code
        /* code */
        break;
    case 2:
        /* code */
        break;
    default: // si tous les case échouent
        /* code */
        break;
}
```

On peut aussi grouper plusieurs case qui auraient le même effet :

``` cs
switch (variable){
    case 1: // si la variable variable vaut 1,2 ou 3 on exécute le code
    case 2:
    case 3:
        /* code */
        break;
    case 4:
        /* code */
        break;
    default: // si tous les case échouent
        /* code */
        break;
}
```


## 3.3 Les Méthodes

Une mathode s'écrit sous la forme suivante :

``` cs
static void AffichageBienvenue(string nom,string prenom){/* code */}
```

* *static* : ...
* *void* : est la valeur de retour de la fonction (ici elle ne retourne rien)
* *AffichageBienvenue* : nom de la fonction
* *string nom,string prenom* : arguments de la fonction

> \>une méthode statique ne peut appeler que des méthodes statiques

## 3.4 Les Tableaux et listes
Il existe une différence entre les tableaux et les listes. Les *tableaux* peuvent être **multidimentionels** tandis que les *listes* n'ont **pas de taille prédéfinie**

### 3.4.1 Tableaux

``` cs
string[] joueurs = {"Bob","Marc","Tom"};
Console.WriteLine (joueurs[2]); //--> Tom
Array.Sort(joueurs); //classe les éléments du tableau
```
### 3.4.2 Listes

``` cs
List<int> chiffres = new List<int>();
chiffres.Add(4); // la liste contient : 4
chiffres.Add(5); // la liste contient : 4,5
chiffres.RemoveAt(1); // la liste contient : 4

foreach(int chiffre in chiffres){...} //effectue une ittération sur tous les éléments de la liste

IndexOf(var);//recherche var dans la liste et retourne son indice
```

### 3.4.3 Enumérations

Une énumération est une liste de valeurs possibles.

``` cs
enum jours{Lundi,Mardi,Mercredi,Jeudi,Vendredi}//stocké sous forme int mais display

jours variable = jours.lundi;
console.(variable);
```
## 3.5 Dates
Ces deux lignes sont équivalentes :

``` cs
console.writeline(DateTime.now);
System.console.WriteLine(System.DateTime.now);
```

## 3.6 Boucles

``` cs
for (int i=0;i<tab.Length;i++){/*code*/};
while(cond){/*code*/};
foreach(string jour in jours){/*code*/} // Attention car foreach est en lecture seulement. Il peut boucler sur tout type énumérable
break; // dans une boucle = sortie de Boucle
continue; // Passe à l'itération suivante de la boucle
```
> \> Attention aux **Overflows** ou dépassement de capacités. (dépassement de la taille maximale d'une variable)


## 3.9 Attributs et constructeurs
