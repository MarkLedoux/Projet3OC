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

        // Create Array of weapons for magicians
        let newWeaponsForMagiciansAttack = [
            Weapon(name: "Earth Attack", damage: Int.random(in: 210...220), weaponType: "Fine"),
            Weapon(name: "Water Attack", damage: Int.random(in: 210...220), weaponType: "Fine"),
            Weapon(name: "Fire Attack", damage: Int.random(in: 250...260), weaponType: "Masterwork"),
            Weapon(name: "Air Attack", damage: Int.random(in: 250...260), weaponType: "Masterwork"),
            Weapon(name: "Combined Elemental Attack", damage: Int.random(in: 280...290), weaponType: "Rare"),
            Weapon(name: "Dark Magic Attack", damage: Int.random(in: 280...290), weaponType: "Rare"),
            Weapon(name: "Boulder Crush", damage: Int.random(in: 320...330), weaponType: "Exotic"),
            Weapon(name: "Cyclone", damage: Int.random(in: 320...330), weaponType: "Exotic"),
            Weapon(name: "Freeze Over", damage: Int.random(in: 360...370), weaponType: "Ascended"),
            Weapon(name: "Pyroclastic Explosion", damage: Int.random(in: 360...370), weaponType: "Ascended"),
            Weapon(name: "Magna Flow", damage: Int.random(in: 450...500), weaponType: "Legendary"),
            Weapon(name: "Sunburn", damage: Int.random(in: 450...500), weaponType: "Legendary"),
            Weapon(name: "Dark Conjuring", damage: Int.random(in: 450...500), weaponType: "Legendary")
        ]

        // Create Array of weapons for all the other classes
        let newWeaponsForOtherClasses = [
            Weapon(name: "Super Javelin", damage: Int.random(in: 160...170), weaponType: "Fine"),
            Weapon(name: "Super Sword", damage: Int.random(in: 160...170), weaponType: "Fine"),
            Weapon(name: "Super Knife", damage: Int.random(in: 160...170), weaponType: "Fine"),
            Weapon(name: "Super Gun", damage: Int.random(in: 160...170), weaponType: "Fine"),
            Weapon(name: "Dwarf Made Axe", damage: Int.random(in: 190...200), weaponType: "Masterwork"),
            Weapon(name: "Dwarf Made Large Sword", damage: Int.random(in: 190...200), weaponType: "Masterwork"),
            Weapon(name: "Dwarf Made Sword", damage: Int.random(in: 190...200), weaponType: "Masterwork"),
            Weapon(name: "Thief Dagger", damage: Int.random(in: 190...200), weaponType: "Masterwork"),
            Weapon(name: "Elven Mace", damage: Int.random(in: 220...230), weaponType: "Rare"),
            Weapon(name: "Platinum Scepter", damage: Int.random(in: 220...230), weaponType: "Rare"),
            Weapon(name: "Fast Firing Pistol", damage: Int.random(in: 220...230), weaponType: "Rare"),
            Weapon(name: "Elven Sword", damage: Int.random(in: 220...230), weaponType: "Rare"),
            Weapon(name: "Focus", damage: Int.random(in: 250...260), weaponType: "Exotic"),
            Weapon(name: "Orion Shield", damage: Int.random(in: 250...260), weaponType: "Exotic"),
            Weapon(name: "Thor's Hammer", damage: Int.random(in: 250...260), weaponType: "Exotic"),
            Weapon(name: "Old Wooden Long Bow", damage: Int.random(in: 250...260), weaponType: "Exotic"),
            Weapon(name: "66Rifle", damage: Int.random(in: 290...300), weaponType: "Ascended"),
            Weapon(name: "Quick Fire Short Bow", damage: Int.random(in: 290...300), weaponType: "Ascended"),
            Weapon(name: "Golden Staff", damage: Int.random(in: 290...300), weaponType: "Ascended"),
            Weapon(name: "Shockwave Harpoon Gun", damage: Int.random(in: 290...300), weaponType: "Ascended"),
            Weapon(name: "Tungsten Spear", damage: Int.random(in: 350...450), weaponType: "Legendary"),
            Weapon(name: "Titanium Trident", damage: Int.random(in: 350...450), weaponType: "Legendary"),
            Weapon(name: "Chromium Scythe", damage: Int.random(in: 350...450), weaponType: "Legendary"),
            Weapon(name: "Dragon Scale Elven Sword", damage: Int.random(in: 350...450), weaponType: "Legendary"),
        ]

        if character is Magician {
            character.weapon = newWeaponsForMagiciansAttack.randomElement()!
            } else {
            character.weapon = newWeaponsForOtherClasses.randomElement()!
        }
        print("\(character.name) found \(character.weapon.name) in the TREASURE CHEST. \(character.name) will now be equipped with this weapon which can inflict \(character.weapon.damage) damage and is a \(character.weapon.weaponType) type of weapon.")
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
