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

    print("\(player1.team[0].name) has \(player1.team[0].healthPoints) HP")
    print("\(player1.team[1].name) has \(player1.team[1].healthPoints) HP")
    print("\(player1.team[2].name) has \(player1.team[2].healthPoints) HP")
    print("\(player2.team[0].name) has \(player2.team[0].healthPoints) HP")
    print("\(player2.team[1].name) has \(player2.team[1].healthPoints) HP")
    print("\(player2.team[2].name) has \(player2.team[2].healthPoints) HP")

    print("Now it's time to fight! \(player1.name), please choose the character you want to use to attack!")
    player1.fightingLoop()

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
            print("The dice fell on \(roll)!")
            print("You win!")
            Player.changeCharacterWeapon()

            return true
        }
        print("The dice fell on \(roll)!")
        print("Better luck next time!")
        return false
    }

}
