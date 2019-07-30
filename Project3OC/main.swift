//
//  main.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 05/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Foundation


var welcomeToGame = "Welcome to the Ultimate Fantasy Game!"
    print(welcomeToGame)
print("Time to choose names!")
print("Player 1, your turn!")
print("Please enter your name!")

var player1 = Player()
player1.naming()
print("Player 2, your turn!")
print("Please enter your name!")

var player2 = Player()
player2.naming()
print("Player 1 will now be refered to as \(player1.name)")
print("Player 2 will now be refered to as \(player2.name)")

print("Now, it's time to create your teams!")
print("Let's start with you \(player1.name) ")
player1.createTeam()
print("Now it's your turn \(player2.name) ")
player2.createTeam()




print("\(player1.team[0].name) has \(player1.team[0].healthPoints) HP")
print("\(player1.team[1].name) has \(player1.team[1].healthPoints) HP")
print("\(player1.team[2].name) has \(player1.team[2].healthPoints) HP")
print("\(player2.team[0].name) has \(player2.team[0].healthPoints) HP")
print("\(player2.team[1].name) has \(player2.team[1].healthPoints) HP")
print("\(player2.team[2].name) has \(player2.team[2].healthPoints) HP")

print("Now it's time to fight! \(player1.name), please choose the character you want to use to attack!") //TODO: solve bug as instead of showing the player's name it shows the name of the last character in each player's team

player1.fightingLoop()
