## Chapitre 7 : Regex
### syntaxe : 
#### Elements de motifs 

* a  : représent le caractère a
* \d : représente un chiffre

#### décorateurs

* a+ : suite de un ou plusieurs a 
* a|\d : le caractère a ou un chiffre

#### Elements de motifs simples

* **\\\^  \$  \.  \*  \+  \?  \(  \)  \[  \]  \{  \}**

#### caractères spéciaux

* \t : tabulation
* \n retour à la ligne

#### elements de motifs composites

* [aeiou] : une voyelle
* [0-9] : représente un chiffe
* [a-d$] : "a", "b", "c", "d" et "$"
* [^aeiouy] : un char qui n'est pas une voyelle
* [A-Z] : représente un caractère qui n'est pas une lettre majuscule
* \d : un chiffre
* \D : un char qui n'est pas un chiffre
* \w un char alphanum
* \s un blanc (espace, retour à la ligne, tabulation)
* \d-?\d : 2 chiffres avec éventuellement un tiret entre les deux
* [A-Z]* : séquence de 0?1 ou plusieurs lettres majuscules
* [13579]{3} : sequence de 3 impaire
* [^\.]{4,8} entre 4 à 8 caractères autre que le point 
* \d|Z : un chiffre ou la lettre Z 
* Tic|Tac : chaine tic ou tac
* ^\d : un chiffre qui se trouve au début d'une ligne 
* zoo$ : un mot "zoo situé en fin de ligne
* \bpoly : la chaine poly au début d'un mot

#### groupements
* \w+(al|aux) : chaine 
* (.)v\1 chaîne teelles que ava, eve, 3V3
* (\d)(\d)\2\1: palindromes à 4 chiffres

### flags
i : ignore Case  
g : global
m : multiline 

### creer regexp 

his
