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


        // TODO: find a way to print those statements using a functions
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

        while player1.team.count >= 1 && player2.team.count >= 1 {
            print("It's time for round \(round)!\n")

            let attackingCharacter = attackingTeam.selectCharacter(in: attackingTeam)
            let chest = GameTool.diceRoll()
            if chest {
                GameTool.changeWeapon(character: attackingCharacter)
            }

            if let magician = attackingCharacter as? Magician {
                let userAnswer = GameTool.getUserChoice(message: "Choose what you want your magician to do! 1: Attack or 2: Heal!", range: (min: 1, max: 2))
                switch userAnswer {
                case 1:
                    let defendingCharacter = attackingTeam.selectCharacter(in: defendingTeam)
                    attackingCharacter.attack(target: defendingCharacter)
                    defendingTeam.removeCharacterWhenDead()

                case 2:
                    let healedCharacter = attackingTeam.selectCharacter(in: attackingTeam)
                    magician.heal(target: healedCharacter)

                default:
                    print("Error, something wrong happened.")
                }

            } else {
                let defendingCharacter = attackingTeam.selectCharacter(in: defendingTeam)
                attackingCharacter.attack(target: defendingCharacter)
                defendingTeam.removeCharacterWhenDead()
            }
            swap(&attackingTeam, &defendingTeam)
            round += 1
            print("\n+++++++++++++++++++++++++++++++++++++++++++++++\n")

        }
        gameOver()

    }

    func gameOver() {
        print("A total of \(round) rounds were played")
        gameWinner()
    }

    func gameWinner() {
        let winner: String
        if player1.team.count > player2.team.count {
            winner = player1.name
        } else {
            winner = player2.name
        }
        print("The game is now over. \(winner) has more members in his team and is therefore declared the winner of this game.")
    }
}
