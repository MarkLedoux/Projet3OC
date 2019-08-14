//
//  GameTool.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 09/07/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Cocoa

class GameTool {
    static var name = [String]()
    static var player1 = Player()
    static var player2 = Player()
    static var round = 1
    static var attackingTeam = player1
    static var attackingCharacter = attackingTeam.selectCharacter(in: attackingTeam)

    // simple print statements used once at the beginning of the game
    static func intro() {
        print("""
                                                                   ++++++++++++++++++++++++++
                                                                   +    WELCOME TO RPG!     +
                                                                   +    The goal is for     +
                                                                   + each player to choose  +
                                                                   +   three characters     +
                                                                   +       and win!         +
                                                                   +      HAVE FUN!!!!      +
                                                                   ++++++++++++++++++++++++++
""")


        print("First off, it's time to choose names!")
        gameStart()
    }

   static func gameStart() {
    print("PLAYER 1")
    print("Choose a name!")
    player1.name = naming()
    print("\nPLAYER 2")
    print("Choose a name!")
    player2.name = naming()

    print("\nPlayer 1 will now be refered to as \(player1.name)")
    print("Player 2 will now be refered to as \(player2.name)")

    print("\nNow the moment you've been waiting for!! It's finally time to create your teams!")
    print("\nLet's start with you, \(player1.name)!")
    player1.createTeam()
    print("\nSorry for the wait, now it's finally your turn \(player2.name)!")
    player2.createTeam()


    // TODO: find a way to print those statements using a functions
    print("\n\(player1.team[0].name) has \(player1.team[0].healthPoints) HP\n")
    print("\n\(player1.team[1].name) has \(player1.team[1].healthPoints) HP\n")
    print("\n\(player1.team[2].name) has \(player1.team[2].healthPoints) HP\n")
    print("\n\(player2.team[0].name) has \(player2.team[0].healthPoints) HP\n")
    print("\n\(player2.team[1].name) has \(player2.team[1].healthPoints) HP\n")
    print("\n\(player2.team[2].name) has \(player2.team[2].healthPoints) HP\n")

    print("\n+++++++++++++++++++++++++++++++++++++++++++++++\n")

    print("Now it's time to fight! \(player1.name), please choose the character you want to use to attack!")

    fightingLoop()

    }

    //make the players attack three times in a row
    static func fightingLoop() {

        var defendingTeam = player2

        while player1.team.count >= 1 && player2.team.count >= 1 {
            print("It's time for round \(round)!\n")

            attackingCharacter = attackingTeam.selectCharacter(in: attackingTeam) //declaring attackingCharacter here makes the selection twice in the code
            GameTool.dropEqualsRolls()

            if let magician = attackingCharacter as? Magician {
                let userAnswer = GameTool.getUserChoice(message: "Choose what you want your magician to do! 1: Attack or 2: Heal!", range: (min: 1, max: 2))
                switch userAnswer {
                case 1:
                    let defendingCharacter = attackingTeam.selectCharacter(in: defendingTeam)
                    attackingCharacter.attack(target: defendingCharacter)
                    resetCharacterWeapon()
                    defendingTeam.removeCharacterWhenDead()

                case 2:
                    let healedCharacter = attackingTeam.selectCharacter(in: attackingTeam)
                    resetCharacterWeapon()
                    magician.heal(target: healedCharacter)

                default:
                    print("Error, something wrong happened.")
                }

            } else {
                let defendingCharacter = attackingTeam.selectCharacter(in: defendingTeam)
                attackingCharacter.attack(target: defendingCharacter)
                resetCharacterWeapon()
                defendingTeam.removeCharacterWhenDead()
            }
            swap(&attackingTeam, &defendingTeam)
            round += 1
            print("\n+++++++++++++++++++++++++++++++++++++++++++++++\n")

        }
        gameOver()

    }

    static func gameOver() {
        print("A total of \(round) rounds were played")
        gameWinner()
    }

    static func gameWinner() {
        let winner: String
        if player1.team.count > player2.team.count {
            winner = player1.name
        } else {
            winner = player2.name
        }
        print("The game is now over. \(winner) has more members in his team and is therefore declared the winner of this game.")
    }

    static func changeCharacterWeapon() {

        if attackingCharacter is Magician {
            attackingCharacter.self.weapon = CombinedElementalAttack(name: "Combined Elemental Attack", damage: 400)
        } else {
            attackingCharacter.self.weapon = DragonScaleElvenSword(name: "Dragon Scale Elven Sword", damage: 300)
        }
    }

    //TODO: find how to bring back the changed weapon to its original value
    static func resetCharacterWeapon() {


    }

    //return of a string for the naming of the players and the characters and checking if there are similarities in terms of the names
    static func naming() -> String {
        if var name = readLine() {
            var isInt: Bool {
                return Int(name) != nil
            }
            let isUnique = !GameTool.name.contains(name)

            if !isUnique {
                print("An error occured, please enter a name which does not already exist.")
                return naming()
            }

            GameTool.name.append(name.capitalized)
            return name
        }
        print("An error occured, please enter a name which does not already exist.")
        return naming()
    }
    

    static func getUserChoice(message: String, range: (min: Int, max: Int)) -> Int {
        print(message)
        if let entry = readLine() {
            if let entryInt = Int(entry) {
                if entryInt >= range.min && entryInt <= range.max {
                    return entryInt
                } else {
                    print("Please enter a number between \(range.min) and \(range.max)")
                    return getUserChoice(message: message, range: range)
                }
            }
        }
        print("Error, please enter a number between \(range.min) and \(range.max)")
        return getUserChoice(message: message, range: range)

    }

    //roll of dice displayed as two random numbers between 1-6 and if the number fall on 6 the treasure box appears
    static func dropEqualsRolls() -> Bool {
        let roll = Int.random(in: 1...6)

        if roll == 6 {
            print("\nThe dice fell on \(roll)!\n")
            print("You win!")
            changeCharacterWeapon()

            return true
        }
        print("\nThe dice fell on \(roll)!\n")
        print("Better luck next time!")
        return false
    }

}
