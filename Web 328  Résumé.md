# Web 328 : Résumé

## Module 1 : Evolution du web

WEB 1,2,3,4

## Module 2 : Applet et servlet

### Applet

**Applet** : code java dans une page html exécuté côté client

```sequence
Client->Server:Access to internet site
Server--> Client:HTML+Applet

```

> Impossible d'accéder aux données de la base de donnée stockée sur le serveur depuis le client. 

### Servlet

**Servlet** code java exécuté côté serveur 

> un servlet peut interagir avec la base de donnée 

En MVC, les servlets sont des controleurs

```sequence
Client->Server:Access to the website
Server->Client: HTML
Client->Server:Call Servlet
Note right of Server:Access BDD
Server->Client: HTML
Client->Server:Call Servlet
Server->Client: HTML
```

## Module 3 : architecture des applications

### 3.1 Architecture d'applications 3 tiers

MVC désigne : 

* Vue : interface avec l'utilisateur (affichage/entrées utilisateur)
* Contrôleur : connexion entre la vue et le modèle (gère les requêtes et passe les informations)
* Modèle : classes qui représentent le domaine de l'application (stockage)

Les avantages de la découpe en couche sont nombreux : (par exemple: sécurité, réusabilité du code, moins de temps de modification en cas de changement d'une couche)

On utilise donc des interfaces pour que les couches doivent implémenter. 

Les erreurs ne doivent pas être propagées non plus.

### 3.2 Architecture des applications spring

En spring , le modèle est géré par les java beans, la vue par les pages JSP et le Controller par les servlets.

Service sont les Business(règles et processus).

## Module 4 : Framework

Spring

inversion de contrôle :

injection de dépendances : 

## Module 5 : Introduction à Spring



### Java Bean 

Pojo : Plain Old Java Object

Il n'étend, n'implémente ni n'annote rien.

Un java bean 

* est un POJO 
* avec aucun argument constructeur
* qui donne acces à ses propriétés via des getter et setters
* est sérialisable

### Spring Framework 

Le Framework spring est pojo-orienté. Il utilise l'injection de dépendance et l'inversion de contrôle.

#### Inversion de contrôle[^idk]

le principe[^idk] de l'inversion de contrôle (container[^idk]) est de gérer le cycle de vie des objets. Il a pour mission de les créer, d'appeler les methodes pour les initialiser et de les configurer en les connectant ensemble. tout ceci est fait principalement via l'injection de dépendances[^idk]

[^idk]: Si j'étais toi, j'irais vérifier par moi même

Le container peut être configuré pour donner les informations nécessaires aux beans. via Fichiers XML ou des annotations dans les classes

#### L'injection de dépendances(DI)[^idk]

est L'habilité d'injecter des composants dans une application d'une façon (typesafe[^idk]).

Et l'habilité de choisir au moment du déploiement quel implementation d'une interface particulière injecter. 

> la mission du programmeur devient de décrire les objets et non plus de les créer

**avantage** : plus facile à maintenir et à tester

un DI implique :

* The implementation of a service object
* The client object depending on the service
* The interface the client uses to communicate with the service
* The injector object responsible for injecting the service into the client 
  * Also referred to as an assembler, provider, container, factory, or spring

### Tomcat Server 

Java HTPP Web Server

Servlet et pages jsp

serving java EE technologies

### Maven Framework

Comment l'app est construite et décrit ses dépendences. 

On peut l'utiliser pour Doc, reporting, build du projet

> pom.xml

### Spring Boot 

Create easily spring based applications.

### Yaml Property File

External properties of project

### Application Class 

Run to launch the application 

Annotation @SpringBootApplication 

* Tags the class as a source of bean definitions for the application context

* Tells Spring Boot to start adding beans

  *  Based on classpath settings, other beans, and various property settings

*  Tells Spring to look for other components, configurations, and services in the package

  > **Uses Spring Boot’s SpringApplication.run method to launch the application**

### Configuration Class

Contains bean definitions

* **@Configuration**  :  Indicates that the class can be used by the Spring IoC container as a source of bean definitions

* **@Bean** : The method will return an object that should be registered as a bean in the Spring application context.
* **@Bean (name = … ) ** :  If no name parameter in the @Bean annotation  the name of the created bean is the method name

## Module 6 : Pages Web

### View Design 

Séparation du contenu de la vue ( Css / Template )

 ### JSP Pages

JavaServer Pages : technologie qui crée dynamiquement des pages web. 

Les pages sont composées d'éléments statiques (html) et de parties construites dynamiquement via *jsp*.

 ### Tag Libraries

Ajouter les librairies de tags au début des pages jsp. les tags sont utilisées ensuite au sein des pages. 

```jsp
<%@ taglib prefix="c" uri="http://..."%>
<%@ taglib prefix="spring" uri="http://..."%>
<%@ taglib prefix="form" uri="http://..."%>
<%@ taglib prefix="fmt" uri="http://..."%>
...
<spring:url var = "actionValue" value='/form/actionInscription'/>
<form:button>Submit</form:button>
<c:if test="${not empty message}">
${message}
</c:if>
```

### Include

ajoute une page jsp dans une autre

 <%@ include file = ...  %> 

 ### CSS

cfr slide module 6

 ### JavaScript

```html
<script src="http:// ..."></script>
<script type="text/javascript">
...
</script>
```

## Module 7 : Controller

### Navigation through Controller 

```java
Controller class{
    get method{//url
        ... //access to services
        return jsp page
    }
}
```

On passe des données à la page jsp par le biais du Model class

### Creating a Controller 

Importer :

* *org.springframework.stereotype.Controller;* 
* *org.springframework.ui.Model;*
* *org.springframework.validation.BindingResult;*
* *org.springframework.web.bind.annotation.*;*

Class annotation:

* **@Controller**

Get method : 

* **@RequestMapping (method = RequestMethod.GET)** 
* Retourne le nom de la page jsp à charger

Request Path

* Path au controller
* A travers des annotations de la classe controller ou une methode get
* **@RequestMapping (…value = … )**

### Parameter in Url 

* **@RequestParam** 
  * *required* : true/false 
  * *defaultValue* : if no value given for the parameter in the url
  
  > url : www. ...../mapage?nameVar=param
  
  ```java
  @RequestMapping(value="/mapage",method=RequestMethod.GET)
  public String sayHello (@RequestParam(required=false,defaultValue="bob")String nameVar){
  	...
  }
  ```
  
  Si différentes méthodes appellent différentes pages, via les arguments de get : 
  
  ```java
  @RequestMapping (… params = {…} ) 
  ```

* liste des nom des paramètres 
* aide le dispatcher servlet à trouver quelle méthode appeler (ex : )

```java
@RequestMapping(value="/mapage",method=RequestMethod.GET)
public String sayHello (){
	...
}
@RequestMapping(value="/mapage",
				params={"nameVar"},
				method=RequestMethod.GET)
public String sayHello (@RequestParam(required=false,defaultValue="bob")String nameVar){
	...
}
```

> Pour les url de type rest, CFR SLIDE 12/53 module 7



### Model Dictionary 

Pour passer des données du modèle du contrôleur à la vue (jsp)

> via org.springframework.ui.Model class 

un set de dictionnaire clé-valeur. 

```java
addAttribute("key",value)
```

on peut ainsi accéder à la donnée via son id dans la page jsp

### Form Controller 

```sequence
Client -> Server : URL
Note right of Server: GET_METHOD
Server -> Client : Form Page
Client -> Server : Submit
Note right of Server: POST_METHOD
Server -> Client : JSP Page
```

#### Model class

Create a model class corresponding to the form

* each form field = a property varable (instance variable) in the class
* Getters/Setters

Create an instance of the form model class 

* In the get method 
* Add it to the Model dictionnary

Create a post method 

* **@RequestMapping (method = RequestMethod.POST)** 

* Pass this form model object as input for Data Binding 

  * Use @ModelAttribute annotation on this input 

* Returns 

  *  Either a jsp page 
  * Or redirection (see further)

  > Cfr Page 22->26 Module 7

### Redirection 

La redirection d'une page jsp peut être : 

une simple page jsp:

```java
return "loginPage";
```

un controller:

```java
return "redirect:/index"
```



### Unified Expression Language (UEL)

Syntaxe pour interagir avec les beans.

Dans les pages web on utilise

```jsp
${scope.expression}
```

scope peut être remplacé par : 

* **applicationScope** : A Map of the application scope attribute values, keyed by attribute name 
* **requestScope** : A Map of the request attributes for this request, keyed by attribute name 
* **sessionScope** : A Map of the session attributes for this request, keyed by attribute name 
* **view** : The root UIComponent in the current component tree for this request 
* **cookie** : A Map of the cookie values for the current request, keyed by cookie name 

* **facesContext** : The FacesContext instance for the current request

* **Header** : A Map of HTTP header values for the current request, keyed by header name 
*  **headerValues** : A Map of String arrays containing all the header values for HTTP headers in the current request, keyed by header name 
* **initParam** : A Map of the context initialization parameters for this web application 
* **Param** : A Map of the request parameters for this request, keyed by parameter name 
* **paramValues** : A Map of String arrays containing all the parameter values for request parameters in the current request, keyed by parameter name

On utilse UEL pour accéder aux données passées par le model dictionnaire

### JSTL 

cfr slides Module 7 

if ... choose == switch

### Form Validation

S'effectue par le biais d'annotations dans la model class

efcfr Slides 

## Module 8 : Template

On utilise un Template pour uniformiser l'affichage de toutes les pages et pour simplifier l'écriture de code (un seul endroit)

### Comment utiliser un template

#### Configurer

##### dépendances  (pom.xml)

```xml
<dependency>
<groupId>org.apache.tiles</groupId>
    <artifactId>tiles-jsp</artifactId>
    <version>3.0.8</version>
</dependency>

```

##### TilesConfig.class

* retirer **internalRessourceViewResolver** de la classe de configuration

* utiliser **TilesViewResolver**:

  ```java
  @Configuration
  public class TilesConfiguration{
      @Bean
      public TilesConfigurer tilesConfigurer(){
          final TilesConfigurer configurer = nw TilesConfigurer();
          configurer.setDefinition("WEB-INF/ressources/tiles.xml");
          configurer.setCheckRefresh(true);
          return configurer;
      }
      @Bean
      public ViewResolver tilesViewResolver(){
          final TilesViewResolver resolver=new TilesViewResolver();
          reolver.setViewClass(TilesView.class);
          return resolver;
      }
  }
  ```



##### tiles.xml

* définition du template

  > cfr page 11
  >
  > attention au integrated devant le nom des pages

* préfix des url ou appliquer le template

#### Créer une page de template 

* Définir la page par défaut 
* Agir comme base pour toutes les autres

#### Creer une page client 

* pages construites sur base du template
* en incorporant des éléments spécifiques au template dedans 

## Module 9 : Composants et services

### Un java bean

* est sérialisable
* N'a pas d'arguments constructeurs
* donne accès aux propriétés par le biais de getters et setters

Est annoté par un **@Component**, un bean peut être pris et injecté dans l'application par spring