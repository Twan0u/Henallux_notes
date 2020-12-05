# 0. Introduction

# 1. Les Activités

## 1.1 Qu'est ce qu'une activité ? 

Une activité est (+-) un écran. On lie généralement un use case à un écran.

Une activité doit : 

* être déclarée dans le manifest
* avoir un layout
* être une implémentation d'une classe java

> conseil : Ajouter une nouvelle activité au moyen de l'interface graphique pour que tout soit configuré automatiquement et que rien ne soit oublié

## 1.2 L'activité "main"

Comme en java et dans beaucoup d'autres langages, il s'agit du point d'entrée de l'application. Ce point d'entrée peut être déclarée dans le **AndroidManifest.xml** 

## 1.3 Lien entre le code et les xml 

Les classes java sont dynamiquement liées au contenu xml. les classes java sont stockées dans le fichier java et les fichiers xml sont quand à eux stockés dans *res/layout*

## 1.4 Le cycle de vie d'une activité

 Le cycle de vie d'une activité est géré en interne et ne devrait jamais être manipulé par le programmeur. 

Quand on implémente une activité, on peut réécrire n'importe quel callback. Par défaut, OnCreate est réécrit (il s'agit de où le layout est mis en place)

```java
public class EditContactActivity extends AppCompatActivity {
 @Override
 protected void onCreate(Bundle savedInstanceState) {
 super.onCreate(savedInstanceState);
 setContentView(R.layout.activity_edit_contact);
 }
}
```

```java
public class EditContactActivity extends AppCompatActivity {
 @Override
 protected void onResume() {
 super.onResume();
 // Triggered when the orientation changes
 }
}
```

### 1.4.1 Callbacks

* **OnCreate : ** Mets en place le layout et lie les données à la vue
* **OnStart** : quand l'activité devient visible pour l'utilisateur
* **OnResume** : Quand l'activité est au sommet de la stack.( c'est le moment ou l'utilisateur entre des données et que il est sur l'app)
* **OnPause** : quand l'activité est momentanément démise ( l'utilisateur à appuyé sur précédent ou retour)
* **OnStop** : L'activité n'est plus visible, ce callback est déclenché par l'utilisateur ou le système lui même. 
* **OnDestroy** : quand l'activité est complètement supprimée, toute ressource (sémaphore, connexion réseaux,...) devrait être libérée ici

### 1.4.2 Changements de configuration

Un changement majeur dans uine activité cause sa destruction et une reconstruction de celle-ci. Par exemple, un changement dans l'orientation, la langue ou la connexion d'un clavier.

Ce changement de configuration à pour effet de recharger les éléments de l'interface (UI), ainsi que quelques variables et éléments custom.

le cycle de vie est le suivant :

Changement -> pause->stop-> destroy->create ->start->resume

### 1.4.3 Android app kill 

android peut détruire des applications en arrière plan. (besoin de ressources, ou random)

### 1.4.4 OnSaveInstanceState()

Callback spécifique qui permets de sauvegarder l'activité quand un onStop est appelé. 

Les données ainsi sauvegardées sont sauvées sous la forme clé-valeur. 

> il est recommandé de garder la quantité ces données sauvegardées petite

```java
public class EditContactActivity extends AppCompatActivity {
@Override
public void onSaveInstanceState(Bundle outState, PersistableBundle outPersistentState)
{
 // Serialize your UI here
 outState.putString(key,value);
 outState.putString(key2,value2);
 super.onSaveInstanceState(outState, outPersistentState);
}
}
```

```java
public class EditContactActivity extends AppCompatActivity {
 @Override
 public void onCreate(Bundle savedInstanceState)
 {
 // Restore your UI here
 fieldName.setText(savedInstanceState.getString(key))
 fieldName2.setText(savedInstanceState.getString(key2))
 }
 // OR
 @Override
 public void onRestoreInstanceState(Bundle savedInstance, PersistableBundle persistentState)
 {
 // Restore your UI here
 fieldName.setText(savedInstance.getString(key))
 fieldName2.setText(savedInstance.getString(key2))
 super.onRestoreInstanceState(savedInstance, persistentState);
 }
}
```

## 1.5 La back stack 

La back stack stocke en arrière plan les activités précédemment rencontrées. lorsqu'une activité est détruite, on relance l'activité précédente dans la stack avant celle qui vient d'être détruite.

## 1.6 Un Intent 

Un intent est une action que l'application doit effectuer. Il peut s'agir de démarrer une activité ou un service. 

Les intents sont principalement utilisées pour naviguer au sein de notre application et utiliser des fonction natives ( contacts, appels, sms, ...)

Les intents peuvent viser une application explicitement ou explicitement (par exemple : utilisation de l'appareil photo). un autre exemple d'intent implicite serait l'ouverture d'un navigateur. 

ce choix implicite sera en fonction des applications installées sur l'appareil. 

une application qui sait par exemple gérer la navigation doit l'avoir précisé dans son manifest.

>• List of all callbacks : https://developer.android.com/guide/ components/activities/intro-activities • List of common Intent/pickers : https://developer.android.com/guide/components/intentscommon#top_of_page

### 1.6.1 Démarrer une activité 

```java
Intent intent = new
Intent(this,AddContactActivity.class);
startActivity(intent);
```

### 1.6.2 Démarrer une activité avec des parametres

> E.G. : add a new contact with some data prefilled

dans la classe source

```java
Intent intent = new
Intent(this,AddContactActivity.class);
Intent.putExtra(“extra_prefill_name”,”John Doe”);
startActivity(intent);
```

dans la classe target

```java
@Override
protected void onCreate(Bundle savedInstanceState) {
 …
 Intent intent = getIntent();
 String name = intent.getStringExtra("extra_prefill_name");
}
```

# 2. TODO

# 3. ViewModels

MVVM est une structure qui sépare *Model*, *view* et *viewModel*.

## 3.1 Cycle de vie

Le cycle de vie d'un *viewModel* est différent de celui d'une activité. 

* Le *viewModel* **survis aux changements de configuration** mais est **supprimé quand son *fragment* ou *activité* associé est détruite**. 

  > attention aussi aux silent kills d'android
  >
  > Il est important de ne jamais étendre ni implementer viewmodel et myviewcomponent.

## 3.2 LiveData 

On place les variables du viewModel dans des livedata. Celà rends plus facile d'automatiser (à l'aide d'un observer) les changements d'ui basés sur les modifications de variables. 

## 3.3 openclassrooms 

![](https://user.oc-static.com/upload/2018/03/13/15209472051711_final_architecture.png)

### 3.3.1 Lambdas

les lambdas peuvent aider à simplifier le code:

```java
// SANS LES LAMBDAS
button.setOnClickListener(new View.OnClickListener() {
    @Override
    public void onClick(View v) {
        Toast.makeText(this, "Button clicked", Toast.LENGTH_LONG).show();
    }
});

//AVEC LES LAMBDAS
button.setOnClickListener(v -> Toast.makeText(this, "Button clicked", Toast.LENGTH_LONG).show());
```

il suffit d'utiliser java 8 et on précise celà dans le fichier **build.gradle**

```json
android {
    ...
    compileOptions {
        targetCompatibility 1.8
        sourceCompatibility 1.8
    }
}
```

### 3.3.2 Les repositories

Le but des 2 repositories suivants est de procurer une isolation entre la source de donnée (DAO) du *viewModel* pour éviter que le *viewModel* ne manipule pas directement les données .



dans un nouveau package repositories : 

```java
public class UserDataRepository {
    private final UserDao userDao;
    public UserDataRepository(UserDao userDao) { this.userDao = userDao; }
    
    // --- GET USER ---
    public LiveData<User> getUser(long userId) { return this.userDao.getUser(userId); }
}
```

```java
public class ItemDataRepository {
    private final ItemDao itemDao;
    public ItemDataRepository(ItemDao itemDao) { this.itemDao = itemDao; }
    
    // --- GET ---
    public LiveData<List<Item>> getItems(long userId){ return this.itemDao.getItems(userId); }
    
    // --- CREATE ---
    public void createItem(Item item){ itemDao.insertItem(item); }

    // --- DELETE ---
    public void deleteItem(long itemId){ itemDao.deleteItem(itemId); }

    // --- UPDATE ---
    public void updateItem(Item item){ itemDao.updateItem(item); }

}
```

### 3.3.3 Création d'un viewmodel

La première étape consisite à étendre viewmodel. on à aussi un init et un oncreate.

> **Explications :** Et voilà à quoi ressemble notre fameux ViewModel ! ![:D](https://openclassrooms.com/bundles/common/images/smiley/heureux.png) Tout d'abord, ce dernier hérite de la classe [ViewModel](https://developer.android.com/topic/libraries/architecture/viewmodel.html). Puis, nous lui déclarons en variables de classe nos deux repository précédemment créés ainsi qu'une variable de type [Executor](https://developer.android.com/reference/java/util/concurrent/Executor.html), qui nous facilitera l'**exécution en arrière-plan** de certaines méthodes. Ces trois variables sont instanciées directement à partir du **constructeur** de la classe.
>
> Nous avons également créé une méthode `init()` , afin d'initialiser notre ViewModel dès que l'activité se crée et qui sera donc appelée à l'intérieur de sa méthode  `onCreate()` .
>
> Euh, mais du coup pourquoi vérifies-tu dans cette méthode si l'utilisateur existe déjà dans le ViewModel ?
>
> Eh bien tout simplement car le ViewModel **garde en "mémoire"** ses données, **même si l'activité qui l'a appelée est détruite**, comme après une rotation par exemple... ![:)](https://openclassrooms.com/bundles/common/images/smiley/smile.png) C'est d'ailleurs tout l'intérêt du ViewModel ! Ainsi, après une rotation de l'activité TodoListActivity, nous n'aurons **pas besoin de re-récupérer** l'utilisateur en base de données **si** ce dernier a été **précédemment** mémorisé dans le ViewModel.
>
> Puis, nous avons créé différentes méthodes permettant de réaliser des actions sur notre base de données (représentant notre source de données). Nous utilisons la classe **Executor** afin de réaliser de manière **asynchrone** les requêtes de mise à jour de nos tables SQLite.
>
> Il est important de rappeler que **toutes les requêtes** effectuées sur la base de données SQLite en utilisant Room sont exécutées de manière **[synchrone](https://openclassrooms.com/courses/recuperez-et-affichez-des-donnees-distantes/decouvrir-les-taches-asynchrones#/id/r-4913802)** ! Cela peut être problématique si vous récupérez des larges volumes de données... D'où l'importance de placer nous-même les méthodes dans des threads à part.
>
> D'ailleurs, c'est également pour cette raison que nous utilisons le type **LiveData** dans les méthodes  `getItems` et  `getUser` de nos **DAOs**, afin de bénéficier **automatiquement** de la **récupération asynchrone**... ![;)](https://openclassrooms.com/bundles/common/images/smiley/clin.png)



**Classe todolist/ItemViewModel.java** 

>  info : todolist est le "nom" donné à l'application et ne suit pas de regle de nom de package. 

```java
public class ItemViewModel extends ViewModel {

    // REPOSITORIES
    private final ItemDataRepository itemDataSource;
    private final UserDataRepository userDataSource;
    private final Executor executor;

    // DATA
    @Nullable
    private LiveData<User> currentUser;

    public ItemViewModel(ItemDataRepository itemDataSource, UserDataRepository userDataSource, Executor executor) {
        this.itemDataSource = itemDataSource;
        this.userDataSource = userDataSource;
        this.executor = executor;
    }

    public void init(long userId) {
        if (this.currentUser != null) {
            return;
        }
        currentUser = userDataSource.getUser(userId);
    }

    // -------------
    // FOR USER
    // -------------

    public LiveData<User> getUser(long userId) { return this.currentUser;  }

    // -------------
    // FOR ITEM
    // -------------

    public LiveData<List<Item>> getItems(long userId) {
        return itemDataSource.getItems(userId);
    }

    public void createItem(Item item) {
        executor.execute(() -> {
            itemDataSource.createItem(item);
        });
    }

    public void deleteItem(long itemId) {
        executor.execute(() -> {
            itemDataSource.deleteItem(itemId);
        });
    }

    public void updateItem(Item item) {
        executor.execute(() -> {
            itemDataSource.updateItem(item);
        });
    }
}
```

> https://openclassrooms.com/fr/courses/4568746-gerez-vos-donnees-localement-pour-avoir-une-application-100-hors-ligne/5106570-architecturez-votre-application-a-laide-dun-viewmodel



# 4. Fragments   

Les fragments sont des parties de l'ui d'une activité qui sont modulaires . Cela permets de changer des fragments sans changer tout l'ui. 

Les fragments vont dans des containers situés au sein d'une activité.

Pour changer de fragments, il existe 2 méthodes: 

## 4.1 Fragment manager

* Utilise une transaction pour faire l'opération

* a besoin d'un constructeur sans argument

  ```
  private void onClick(){
   FragmentManager fragmentManager = getActivity().getSupportFragmentManager();
   FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
   FragmentDetailsUser fragment = new FragmentDetailsUser(); // Create a new instance of the Fragment to use
   fragmentTransaction.replace(R.id.fragmentContainer, fragment);
   fragmentTransaction.addToBackStack(null); // When the user presses ‘back’ button, the operation is reversed
   fragmentTransaction.commit();
  }
  ```

### 4.1.1 Ajouter des arguments à un nouveau fragment : bundle

```java
public static FragmentDetailsUser newFragment(String userName){
FragmentDetailsUser fragment = new FragmentDetailsUser();
Bundle args = new Bundle();
args.putString(“userName”, userName);
fragment.setArguments(args);
return fragment;
}
public void onCreate(Bundle savedInstanceState) {
if (getArguments() != null) {
String userName = getArguments().getString(“userName”);
}
}
```

### 4.1.2 Attention

* Hard for more complex components (drawers, bottom bar, …) 
* Manual back stack management 
* That’s why Android introduced navigation component in their Android JetPack

## 4.2 The Navigation Component 

Simplifie l'implémentation de la navigation mais aussi : 

* gère les transactions de fragments
* Handling Up and Back actions by default
* Providing standardized resources for animations & transitions 
* Safe-Args plugin to pass data between destinations 

Designed for apps that have one main activity with multiple fragment destinations

### 4.2.1 3 key parts

* **Navigation Graph** : XML Resource centralizing all destinations a user can follow in your app
* **NavHost** : Container displaying destinations from your navigation graph 
* **NavController** : Object managing app navigation within NavHost (orchestrates swapping of destination content) 