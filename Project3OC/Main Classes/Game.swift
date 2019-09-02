//
//  Game.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 15/08/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Foundation

class Game {
    var player1 = Player()
    var player2 = Player()
    var round = 1

    //function to start the game and printing what is required at the beginning of the game
    func start() {
        GameTool.intro()
        print("PLAYER 1")
        print("Choose a name!")
        player1.name = GameTool.naming()
        print("\nPLAYER 2")
        print("Choose a name!")
        player2.name = GameTool.naming()

        print("\nPlayer 1 will now be refered to as \(player1.name)")
        print("Player 2 will now be refered to as \(player2.name)")

        print("\nNow the moment you've been waiting for!! It's finally time to create your teams!")
        print("\nLet's start with you, \(player1.name)!")
        player1.createTeam()
        print("\nSorry for the wait, now it's finally your turn \(player2.name)!")
        player2.createTeam()


        player1.displayTeam()
        player2.displayTeam()

        print("\n+++++++++++++++++++++++++++++++++++++++++++++++\n")

        print("Now it's time to fight! \(player1.name), please choose the character you want to use to attack!")

        fightingLoop()

    }

    //make the players attack three times in a row
    func fightingLoop() {
        var attackingTeam = player1
        var defendingTeam = player2

        //using a condition in order for the game to looop until the condition becomes false
        while player1.team.count >= 1 && player2.team.count >= 1 {
            print("It's time for round \(round)!\n")

            // making the attacking character as a character selected in attacking team
            let attackingCharacter = attackingTeam.selectCharacter(in: attackingTeam)
            //calling the function called dice roll determining if the chest comes out or not
            let chest = GameTool.diceRoll()
            //if the function diceroll returns true then the following line will change the character weapon according to the function in game tool
            if chest {
                GameTool.changeWeapon(character: attackingCharacter)
            }

            // when the attacking character is a magician, get an answer from the player using the get user choice function in game tool
            if let magician = attackingCharacter as? Magician {
                let userAnswer = GameTool.getUserChoice(message: "Choose what you want your magician to do! 1: Attack or 2: Heal!", range: (min: 1, max: 2))
                switch userAnswer {
                case 1:
                    // after getting the answer from the user, case one for attack says the defending character is the one the user selected
                    let defendingCharacter = attackingTeam.selectCharacter(in: defendingTeam)
                    attackingCharacter.attack(target: defendingCharacter)
                    defendingTeam.removeCharacterWhenDead()

                case 2:
                    // for healing, the character to be healed is the one the player selected in his own team
                    let healedCharacter = attackingTeam.selectCharacter(in: attackingTeam)
                    magician.heal(target: healedCharacter)

                default:
                    print("Error, something wrong happened.")
                }

            } else {
                // whenever the attacking character is not a magician these lines will compile instead in order to set as defending character the character selected by the player
                let defendingCharacter = attackingTeam.selectCharacter(in: defendingTeam)
                attackingCharacter.attack(target: defendingCharacter)
                defendingTeam.removeCharacterWhenDead()
            }
            //switch between attacking and defending team 
            swap(&attackingTeam, &defendingTeam)
            round += 1
            print("\n+++++++++++++++++++++++++++++++++++++++++++++++\n")

        }
        // calling the function when the condition in fighting loop is not met anymore
        gameOver()

    }

    func gameOver() {
        print("A total of \(round) rounds were played")
        gameWinner()
    }

    // the winner of the game is decided by comparing how many characters each player has on their team 
    func gameWinner() {
        let winner: String
        if player1.team.count > player2.team.count {
            winner = player1.name
        } else {
            winner = player2.name
        }
        print("The game is now over. \(winner) has more members in his team and is therefore declared the winner of this game.")
        player1.displayTeam()
        player2.displayTeam()
        
    }
}
