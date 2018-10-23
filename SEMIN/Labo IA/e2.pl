woman("AnneCharlotte").
woman("Emilie").
woman("Nelly").
woman("Benedicte").
woman("Noemie").
woman("Paula").


man("Antoine").
man("Benjamin").
man("JeanFrancois").
man("Corentin").
man("Daniel").
man("Bertrand").
man("Alexandre").
man("Nicolas").
man("Ernest").

man("Bob").



father("Bertrand","Alexandre").
father("Bertrand","Nicolas").
father("Bertrand","Noemie").
father("JeanFrancois","Antoine").
father("JeanFrancois","Benjamin").
father("JeanFrancois","Emilie").
father("JeanFrancois","Corentin").
father("Daniel","AnneCharlotte").
father("Daniel","Benedicte").
father("Ernest","JeanFrancois").

father("JeanFrancois","Bob").

mother("AnneCharlotte","Antoine").
mother("AnneCharlotte","Benjamin").
mother("AnneCharlotte","Corentin").
mother("AnneCharlotte","Emilie").
mother("Benedicte","Alexandre").
mother("Benedicte","Nicolas").
mother("Benedicte","Noemie").
mother("Nelly","AnneCharlotte").
mother("Nelly","Benedicte").
mother("Paula","JeanFrancois").

moher("Benedicte","Bob").

couple("Daniel","Nelly").
couple("Bertrand","Benedicte").
couple("Ernest","Paula").
couple("JeanFrancois","AnneCharlotte").


parent(Parent,Who):-father(Parent,Who).
parent(Parent,Who):-mother(Parent,Who).

child(Child,Of):-parent(Of,Child).

son(Parent,Child):-parent(Parent,Child),man(Child).

daughter(Parent,Child):-parent(Parent,Child),woman(Child).

grandmother(GrandMother,Child):-parent(GrandMother,X),parent(X,Child),woman(GrandMother).

grandfather(GrandFather,Child):-parent(GrandFather,X),parent(X,Child),man(GrandFather).

grandson(Child,Old):-grandfather(Old,Child),man(Child).
grandson(Child,Old):-grandmother(Old,Child),man(Child).

granddaughter(Child,Old):-grandfather(Old,Child),woman(Child).
granddaughter(Child,Old):-grandmother(Old,Child),woman(Child).

sibling(X,Y):-father(Father,X),father(Father,Y),mother(Mother,X),mother(Mother,Y),not(X=Y).

brother(Frere,De):-sibling(Frere,De),man(Frere).
brother(Sister,De):-sibling(Sister,De),man(Sister).

realUncle(Uncle,Person):-brother(Uncle,Parent),parent(Parent,Person).
realAunt(Aunt,Person):-sister(Aunt,Parent),parent(Parent,Person).

uncleByMarriage(Uncle,Person):-man(Uncle),parent(Parent,Person),sibling(Parent,Sibling),couple(Uncle,Sibling).
auntByMarriage(Aunt,Person):-woman(Aunt),parent(Parent,Person),sibling(Parent,Sibling),couple(Sibling,Aunt).

uncle(Uncle,Person):-realUncle(Uncle,Person).
uncle(Uncle,Person):-uncleByMarriage(Uncle,Person).

aunt(Aunt,Person):-realAunt(Aunt,Person).
aunt(Aunt,Person):-auntByMarriage(Aunt,Person).

cousin(A,B):-uncle(Uncle,A),father(Uncle,B). 
cousin(A,B):-aunt(Aunt,A),mother(Aunt,B). 

nephew(Neph,Old):-uncle(Old,Neph),man(Neph).
nephew(Neph,Old):-aunt(Old,Neph),man(Neph).

niece(Y,O):-aunt(O,Y),woman(Y).
niece(Y,O):-uncle(O,Y),woman(Y).
halfBrother(X,Y):-parent(Parent,X),parent(Parent,Y),man(X),parent(O1,X),parent(O2,Y),not(O1=O2).
halfSister(X,Y):-parent(Parent,X),parent(Parent,Y),woman(X),parent(O1,X),parent(O2,Y),not(O1=O2).













