//
//  Game.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 07/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Foundation
class Game {
    //roll of dice displayed as two random numbers between 1-6 and if the number fall on 6 the treasure box appears
    func dropEqualsRolls() -> Bool {
        let firstRoll = Int.random(in: 1...6)
        let secondRoll = Int.random(in: 1...6)
        print("\(firstRoll) \(secondRoll)")

        if firstRoll == 6 && secondRoll == 6 {
            print("You win!")

            return true
        }
        print("Better luck next time!")
        return false
    }
    //looping the fight action TODO: refactor fight action
    func gameLoop() {

        while player1.team.count > 0 && player2.team.count > 0 {
            
            player1.team[0].attack(target: player2.attackTargetForPlayer1(target: player2.team[1]))
            player2.removeCharacterWhenDead()

            print("Alright, let's get rolling, please choose a second character to attack in \(player.name)'s team")

            player1.team[0].attack(target: player2.attackTargetForPlayer1(target: player2.team[1]))
            player2.removeCharacterWhenDead()

            print("Now how about a third!")

            player1.team[0].attack(target: player2.attackTargetForPlayer1(target: player2.team[1]))
            player2.removeCharacterWhenDead()

            print("Now it's your turn \(player2.name)! Please choose who you want to attack in \(player1.name)'s team!")

            player2.team[0].attack(target: player1.attackTargetForPlayer2(target: player1.team[1]))
            player2.removeCharacterWhenDead()

            print("Alright, let's get rolling, please choose a second character to attack in \(player2.name)'s team")

            player2.team[0].attack(target: player1.attackTargetForPlayer2(target: player1.team[1]))
            player2.removeCharacterWhenDead()

            print("Now how about a third!")

            player2.team[0].attack(target: player1.attackTargetForPlayer2(target: player1.team[1]))
            player1.removeCharacterWhenDead()
        }

    }

    
}
