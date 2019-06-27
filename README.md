# Projet3OC

What this project was about: 

This project is part of an online course delivered by OpenClassrooms in which I am supposed to make the architecture code for a RPG game through the MacOS Command Line Tool of XCode. 

What I've learned: 

This project enabled me to:  
- become more familiar with OOP concepts and terminology
- learn to think of what i want to do when building the code of an app
- think of code as problems to solve in order to reach a desired result
- split large tasks into smaller, more manageable tasks which take less time to complete 
- understand more about concepts in OOP I still had trouble with

Below will be the main points of what I was tasked to do in Frenchm, which. I then summarized in my own words in a TODO List: 

Mais là, c’est un jeu de rôle, l’équilibrage est très important ! (RPG)
Charlotte : Mais plutôt qu’un proto complet, j’ai surtout besoin de travailler les personnages, leurs caractéristiques, etc. Du coup, j’aurais bien voulu un genre d’application qui implémente la logique de jeu.
L’idée c’est d’avoir un système de jeu presque complet, sans visuel, mais qui permet déjà de réaliser des combats entre les perso !
J’ai donc besoin que tu réalises le code d’une application iOS permettant de :
1. Initialiser le jeu en sélectionnant les personnages des deux équipes, en les nommant tous de manière différente (ce sera plus simple pour moi) ;
2. Réaliser le combat au tour par tour. L’idée, c’est donc que le joueur 1 puisse choisir un personnage de son équipe, choisir le personnage qui va subir l’action (dans l’équipe adverse en cas d’attaque ou dans son équipe en cas de soin), de réaliser l’action, puis de vérifier si la partie est terminée, sinon c’est au tour du joueur 2 ;
3. Une fois la partie terminée (lorsque tous les personnages d’une équipe sont morts), tu affiches le joueur qui a gagné et les statistiques de jeu : le nombre de tours et la liste des personnages des deux équipes avec leurs propriétés (point de vie, etc.).
Si je résume la base du jeu : celui-ci est composé de deux joueurs. Chaque joueur a une équipe composée de trois personnages. Chaque personnage a des points de vie, un nom et une arme.
Ah oui, j’ai oublié de te préciser, les personnages attaquent avec une arme. C’est elle qui doit déterminer les dégâts que le personnage va réaliser. Une autre fonctionnalité qu’il faut absolument intégrer (j’aimerais ajouter un peu de hasard dans le jeu) : un coffre peut apparaître devant un personnage quand celui joue son tour. Ce coffre contiendra forcément une arme (plus ou moins puissante que celle existante).
J’attends avec impatience ton projet !
Si tu pouvais aussi le commenter au maximum. Je sais, ça revient à dire: « n’oublie pas de respirer », mais comme c’est moi qui vais utiliser ton projet, et que je ne suis pas une développeuse (même si j’ai des bases), c’est encore plus important.
Merci beaucoup !
Charlotte, game-designeuse, FrenchGameFactory
 
Livrables
* Le code source sous forme de projet Xcode :
    * prêt à compiler,
    * écrit en Swift,
    * en anglais.
* Un support (Powerpoint ou PDF) décrivant l’architecture du jeu (organigramme des classes ou autre).


TO DO LIST 

Game
- Create a class game that will contain the players 

Players 
- Create a players class as well as two players who will inherit from the players class 
- Each player should be able to choose their own name 
- Give each player the ability to choose the characters who will be part of their team. 
- Each team should be made up of three characters
- No two similar races can be found in the same team whatever the gender is 
- Each player should be able to choose the gender of each of it’s characters 
- When choosing the characters, the players should be able to see the characters’ stats and choose the characters accordingly 

Characters 
- Characters can either be male or female
- Characters will be split into four races 
- Each race will possess its own specific characteristics among which: weapon, health points
- Each character will take on a specific name chosen by the players
- Health points will change depending on the race and the gender of the character
- The damage done when attacking or healing will take into account a percentage between the strength of the weapon of one player to another 

Fighting 
- Give the players the ability to choose which character they’ll use to attack or heal and which character the attack will be directed at 
- Make rounds by having the players attack one after the other 
- Check the status of each character’s HP and say the character is KO when the HP reaches zero
- When the HP of all three characters of a player have reached zero declare which player won and who lost

Below will be a copy of all the notes I took when making this project: 

WHAT THE GAME SHOULD REFLECT (writing what the code will do in full sentences)

When the game starts, print Welcome to Ultimate Fantasy 
Call player 1 and from then the player chooses his name and the three characters.
When choosing the characters, the screen will print the characters stats so the player can choose who he wants in his team 
The player will be asked to enter the name he’s chosen for his characters from a list of names split between male and female 
After player 1 has chosen his characters, call on player 2 to do the same following the same process 

When the fighting starts starting with player 1 cycle through his characters and the player choose the actions he wants to make and again which person he wants to make it. when the choice has been made, roll two dice, print the result  and if the result on each dice is the same, print a text saying the player won the roll offer a casket will give the characters an increase of the weapon stronger but a percentage decided by the number which came out of the dice 1 being the lowest and the highest(critical hit) . After which take into account the weapons resulting from the dice roll and proceed with the attack. 
During the attack, the characters will attack the enemy and after each character has attacked check the HP of the character who took damage and print the resulting HP. 
When all character for the player have attacked check the character’s HP of both players and if HP are above zero for at least one character print that the fight goes on and call the other player. When a character’s HP goes below or equals zero then say the character has been rendered unable to fight. When all the characters of a player are KO then print that the fight is over and print the player who won and the one who lost and print the game stats 




From bottom to top in order of less to most important inside the game 

Starting with the race, some characteristics will change if the race changes but also as the characters gender changes
File for races can be in the same file as the one for characters 
Damage point on average between 40-150 depending on the race and the weapon used
Type of weapons thin sword, large long sword, guns, and knifes, staff 

If male : 

Werebison: 775 weapon : large sword or Axe
Elf: 450 weapon : guns or bow
Magician : 250 weapon : staff 
Human : 500 weapon : javelin or thin sword 

Female: 
Werox: 675 weapon : large sword or Axe
Elf: 750 weapon : bow or two knives 
Magician : 500 weapon : staff
Human : 450 weapon : thin sword 

Don’t forget to add comments to say what the lines of code do 


Passer fonctions create à players
Pas deux fois le meme nom 
Assigner un tableau ou on peut assigner automatiquement les noms des personnages ? 
Toujours mettre les noms de classe au singulier

Create a new class for weapon with damage and name properties;
When dice rolls are the same: fun saying a chest has been found and which replaces the weapon used by the character 

Create class weapon and weapons similar to how I made characters 

For characters since I start with an empty array made of characters, when creating team, I use a func to first count the number of elements in the array and as long as the number of elements is below 3 I keep adding elements

Steps required to complete the game 
