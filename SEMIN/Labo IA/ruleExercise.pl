% Sentence1
mortal(X):-human(X).

human(bob).

% Sentence2
attractiveFor(What,Who):-toy(What),playMusic(What),child(Who).

toy(flute).
playMusic(flute).
child(bob).

% Sentence3

precious(What):- gold(What).
precious(What):- silver(What).

gold(gold).
silver(silver).

% Sentence4

predator(Pred,Prey):-cat(Pred),mouse(Prey).

cat(tom).
mouse(jerry).

% Sentence5

european(People):-french(People).
european(People):-italian(People).

french(jean).
italian(pedro).

% Sentence6

bird(Animal):-parrot(Animal).
talk(Animal):-parrot(Animal).

parrot(Pipo).

% Sentence7

benelux(People):-belgium(People).
benelux(People):-netherlands(People).
benelux(People):-luxembourg(People).

belgium(antoine).
netherlands(kristien).
luxembourg(gilles).

% Sentence8

juged(Who):-murderer(Who),caught(Who).
imprisoned(Who):-murderer(Who),caught(Who).

murderer(herrent).
caught(herrent).
caught(nathan).

% Sentence9

intimidatedBy(By,Who):-fatherChrismas(By),child(Who).
intimidatedBy(By,Who):-santaClaus(By),child(Who).

% Sentence10

punished(Person):-accused(Person),guilty(Person).
hasRecord(Person):-accused(Person),guilty(Person).

% Sentence11

famous(Person):-star(Person).
famous(Person):-sportsman(person),olympicMedal(Person).
followedByMedia(Person):-star(Person).
followedByMedia(Person):-sportsman(person),olympicMedal(Person).

% Sentence12

mayBeArested(Person):-drives(Person),drunk(Person).
mayBeArested(Person):-hasGun(Person),withoutLicense(Person).

% Sentence13

discount(Person):-student(Person),grantHolder(Person).
discount(Person):-age(<65,Person).
discount(Person):-unemployed(Person).
discount(Person):-parent(Person,Child).

freeFirstIssue(Person):-student(Person),grantHolder(Person).
freeFirstIssue(Person):-age(<65,Person).
freeFirstIssue(Person):-unemployed(Person).
freeFirstIssue(Person):-parent(Person,Child).
