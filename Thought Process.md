# Projet3OC

Below is an overview of all the notes i've taken on my computer during this project and can be used to see what my thought process was like. This files also includes notes taken during my mentoring sessions.

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

- Start Game by printing a welcome message 
- Have player 1 create his name 
- Have player 2 create his name
- Check if the names are different and If the names are the same ask player 2 to choose a different name 
- Create teams and make sure players can choose characters’ races and genders DELAYED
- Create rounds in the game DELAYED
- Code refactoring 

Idea? Include the races in an array and make the player choose the race and weapon he wants to use
What is needed to achieve that? 
Linked the class inherited from character to the parameter so the references can be cycled through and the player can choose between all of them
Or 
Create an enum in which with types related to the classes inheriting from character and create a function called createCharacter that’ll make it possible to create a character directly in the team 

Code to choose type 

For teammates 


TODO on July 2
- Ask player to choose the type of his character(Human, Elf, Magician or Werebison)
- Then ask player to choose the gender for the character 
- Ask player to choose the name (this action is already done), check to see if the code will need changing 
- Add character to the team

Task 1 : CHOOSE CHARACTER TYPE
- Specify which four types are available to choose 
Code 

After mentoring session 

Refactor code dans le fichier game
Faire en sorte qu’une fonction ne fasse qu’une seule chose à la fois 

Step 1 Penser a la fonction static pour voir si le nom des joueurs et de chaque équipe, choix des personnages et choix des armes d’attaque
Print sentence in setCharacterName and take or errors if player doesn’t enter a name

Step 2 Gestion des combats

Step 3 resultat du coffre avec une nouvelle arme


IMPLEMENTING FIGHTS
- Get one character of one team to attack a character on the other team
- Get a character in one team to attack another after the player’s input 
- Get the characters in one team to attack the other team in succession after player’s input 
- make user input relevant not to the number used in the array of the team but corresponding to the numbers specified in the function  

When a player attacks 
- User input to choose target (1-3) 
- Return the desired target(0-2) in array 
- Attack 

When HP are below zero character is dead
- When hp fall below zero remove character index
- Print that the character is dead 

For fights use a for in loop 
Split into two methods for attack target for player 
- One to list a team’s members
- Second to select the characters
- Count the number of characters in array and select number must be inferior or equal to the number of index in array 
- Use static var for player to store all the names already used then being able to return strings when checking If the names are different
- In game define an attacker and defender different each turn, extract character from player and check the class of the character 
Change name to remove dead character

Call remove dead character only when the character hp are below zero
Make it possible for character to choose weapon
Update character’s description with more details 
When only one character in team no choice possible and select for the player by default 
Penser au principe de RESPONSABILITÉ UNI    QUE des fonctions 
Commenter le plus possible
During fights detail of the actions in order, what happens or needs to happen
- Print a statement asking to choose which character the player wants to attack with. The choice needs to adjust to the count in the character’s team so if there are two characters the choice can only 1 and 2 and if there is only one character left, no need to give the player the choice to choose his character.
- Print the choices available using 1-3 and displaying the class of the character, his name and the weapon and damage points it will give 
- Ask the player to enter the number of his choice conforming to the choice depending on how many characters are in the team 
- Print a statement asking the player which character he wants to attack in the opposite team and display the same information displayed as when the attacking player is asked to choose which character he wants to attack with 
- Display which character attacked with which weapon and how many HP the opposing character lost
- Repeat with the other characters in the attacking player team 
- Tell the other player it is his turn and repeat the same process 

- Make it impossible for players to choose the same character to attack when it has already attacked as that wouldn’t be fair if a player only used the same character for attacking


Faire un fichier helper ou on la gestion des names est effectuée utilisation pour players et characters 

Phase de combat 
- Faire en sorte que le joueur puisse attaquer trois fois avant de passer la main à l’autre joueur
- Enlever les personnages quand ils sont morts 
- Refactoriser les fonctions pour les noms
- 
Names to test the project in order of use 
vinceled
josh 

Liberty
Amandine 
Oscar

Kora
Franklin
Michael

Transcript of the fight in a sentence 
While there are more than one character in player 1’s team and more than one character in player 2’s team: 
- Set the attacking player as player 1 
- Set defending player as player 2 
- Have player 1 attack player 2 three times
- Set attacking player as player 2 
- Set defending player as player 1 
- Have player 2 attack player 1 three times 
- Increase number of rounds 
- Repeat 
- When the statement becomes false end the loop and display the winner 
- If player 1 has more character in his team than player 2 then player 1 is winner otherwise player 2 is the winner 
- Display the number of rounds that were played overall for the whole game 
- 

TODO:
- Solve bugs seen in the code like the bug that makes it impossible to select the second member to attack in the opposing team when a member dies 
- Change text to better reflect what happens during the fighting like how many HP the characters have left 
- Find how and where to increment the number of rounds 
- Make a heal function heal that gives our healing points or make it a weapon that makes it possible to heal think about the box that appears in front of the character 
- 

Use of a local variable before its declaration? Execute but then use of a break to redeclare the property? 

TODO for 15/8: 
- Implement getUserChoice in the code and think about the range when removing dead characters
- Move all fight functions to main as well as properties
- Think of the message for the end of the game 
- Add two weapons that can be found in the box 
- Use downcasting to specify which actions take place according to the class of character finds the box
- Prevent players from entering a void name 

Give the characters a new weapon when the dice fall on the right number 
- Change the name of the weapon the character uses 
- Change the damage the character’s weapon deals
- Overiding the current weapon of the character deal damage to the opponent

Introduce different weapon levels depending on the number that that dice fall on.
Make 6 levels each including different weapon depending on the character class and depending on the number 1-6 the dice fall on tell the class of the weapon, the name and how much damage it’ll give the opponent. 


When attacking usually: 
- setting attacking and defending team
- Setting attacking character as a character selected in the attacking team
- If the selected character is a magician, then ask user if he wants to attack or to heal
- Get user answer
- Heal or attack depending on what the user chose
- Set defending character if the user chooses to attack 
- Resolving damages


What happens when I specify a new weapon, what is needed: 
- No need to set up the attacking team since this is already specified for us at the beginning of each turn
- The function needs to define the possible actions that can happen if the character selected is a magician, a were bison or of any of the other races
- If the selected character is a magician then set the weapon accordingly and same if other races are selected 
- To set the weapon to the character, we’ll need to bypass the default weapon of the character 
- That means the function will need to return a weapon 
Reset the character’s weapon after the turn with the winning roll ends? 

TODO:
- Add more weapons for the box  scraped?
- depending on how much more powerful the weapon is add a class for its status 
- Implement critical hit when the damage inflicted is 2x greater than the opponent’s HP 
- Make the text in the game more readable
- Finish implementing the box 
- Move the code to where it belongs ?
- 


Weapons creation for the mystery box 

￼
￼

Classes for weapons: 
- default weapons are considered to be basic weapons 
- In the box others weapons will range between 6 categories and will be chooses at random 
- All classes will be defined based on the default weapons and the select classes will only have access to select weapons 
- Fine weapons will be stringer by 1.2 times
- Masterwork by 1.4 times 
- Rare 1.6
- Exotic 1.8
- Ascended 2
- Legendary 2.5

New weapons to  add to the project 
- Dagger 
- Mace 
- Scepter 
- Axe 
- Pistol
- Sword
- Focus 
- Shield 
- Torch
- Warhorn
- Great sword 
- Hammer 
- Long bow
- Rifle 
- Short bow 
- Staff 
- Harpoon gun
- Spear 
- Trident 
- Earth 
- Fire
- Air
- Water
- Dark 

Magician will only have access to six kinds of spells according to the same principles used for the weapons 
- Random between water, air, earth, fire
- Earth crush or air tornado
- Water freeze or fire explosion 
- Magma flow
- Sun’s burn 
- Dark conjuring 

IDEA SCRAPED?

TODO: 
- Move each line of code to where it needs to be 
- The player file should only have the create team and select characters lines
- Game should have the code to start the game, start the fight, end the game 
- Character should have the lines used to create a character for the team
- Game tool should have all the rest of the lines
Print a description in game tool to limit size of player 

Have weapons that can heal when the player chooses heal and falls on the treasure chest and that will either bump up the way for the magician to heal his teammates or heal all his team by a certain number of points

Weapons for magician healing 
Fine 
Masterwork
Rare
Exotic 
Ascended 
Legendary


TODO 
Class diagrams
Pdf for rules and description 
Code commentary 

Create new read me for rules of the game, thought process and explantation on some of the games functionalities. 

TO DO LIST 
 ⁃ finish commenting the code
