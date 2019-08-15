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
    }

    static func changeWeapon(character: Character) {

        if character is Magician {
            character.weapon = CombinedElementalAttack(name: "Combined Elemental Attack", damage: 400, weaponType: "Basic")
        } else {
            character.weapon = DragonScaleElvenSword(name: "Dragon Scale Elven Sword", damage: 300, weaponType: "Basic")
        }
        print("\(character.name) found \(character.weapon.name) in the TREASURE CHEST. \(character.name) will now be equipped with this weapon which can inflict \(character.weapon.damage) and is a \(character.weapon.weaponType) type of weapon.")
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
    static func diceRoll() -> Bool {
        let roll = Int.random(in: 1...6)

        if roll == 6 {
            print("\nThe dice fell on \(roll)!\n")
            print("You win! Now the treasure chest will open!!")
            return true
        }
        print("\nThe dice fell on \(roll)!\n")
        print("Better luck next time!")
        return false
    }

   static func characterTypeIntro() {
        print("""
            Please choose your character's type :
            1 - Human:
                 475HP for male and 110 damage points
                 500HP for female and 120 damage points

            Humans might not possess as much healthpoints as the elves do nor do they possess the same amount of knowledge as the magicians but
            They can still hold their on in a battle. Out of all the races Humans possess the most balanced points between the damage
            They can inflict and how enduring they can be where their healthpoints are concerned.

            2 - Elf:

                450HP for male and 90 damage points
                750HP for female and 80 damage points

            Hearing their names would at first glance make one think they'd be fierce warrior but contrary to most everyone's beliefs;
            Having prioritized their knowledge, despite their high healthpoints, the elves represent the most underwhelming race as far as
            Physical prowess is concerned. Still despite this setback, they can prove to be quite useful in battle.

            3 - Magician:

                250HP for male
                500HP for female

                Both of them inflict 180 damage points

            Don't be fooled by the amounts of healthpoints the magicians have! They pack quit the punch.
            Intellectual monsters, the vast knowledge they possess have made them experts in all kind of magics.
            Their strength in magic still stand unrivaled amongst all the other races making them the fiercest of fighters.

            4 - Werebison:

                675HP for male and 140 damage points
                775HP for female and 150 damage points

            Believing in no one but themselves, the werebison have learned to count on nothing but the things they're good at.
            In their case, this came down to training to fight and they've honed their fighting skills generation after generation in a strict
            Spartan like military culture. The result? Despite not being as knowledgeable as the magicians, due to their increasingly high endurance
            which is even higher than that of the elves, the werebisons still managed to get  their fighting skills almost on par with that of the magicians.

""")
    }

}
