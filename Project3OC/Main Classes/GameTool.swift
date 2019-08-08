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
    // simple print statements used once at the beginning of the game
    static func gameIntro() {
        print("Welcome to the Ultimate Fantasy Game!")
        print("Time to choose names!")
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
            Player.giveADifferentWeaponWhenDifferentClassesOpenTheBox()

            return true
        }
        print("The dice fell on \(roll)!")
        print("Better luck next time!")
        return false
    }

}
