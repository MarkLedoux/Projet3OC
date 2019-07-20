//
//  Characters.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 05/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Foundation

class Character {
    // MARK: Properties
    enum Gender {
        case male, female
    }

    var name = ""
    var healthPoints: Int
    var gender: Gender
    var weapon: Weapon
    static var characterNames = [String]()



    init(name: String, gender: Gender) {
        self.name = name
        self.healthPoints = 0
        self.gender = .male
        self.weapon = Weapon(name: "Large Sword", damage: 150)
    }
    // MARK: Logic

    //attacking the other's player's character and setting damage
    func attack(target: Character) {
        if healthPoints > 0 {
            target.healthPoints -= self.weapon.damage
            print("\(self.name) used \(self.weapon.name) and inflicted \(self.weapon.damage) damage points to \(target.name), now \(target.name) only has \(target.healthPoints) HP left. ")
        } else {
            print("This character is already dead you cannot attack him anymore.")
        }

    }

    func nameCharacter() -> String {
        if var name = readLine() {
            var isInt: Bool {
                return Int(name) != nil
            }
            let isUnique = checkIfNamesAreDifferent(nameToBeChecked: name.capitalized)
            print(isUnique)

            if !isUnique {
                print("An error has occured, please enter a name which does not already exist for your character!")
                return nameCharacter()
            }
            self.name = name
            Character.characterNames.append(name.capitalized)
            return name
        }
        print("An error occured, please enter a name which does not already exist for your character.")
        return nameCharacter()
    }

    //logic to check if the character names are different or not in all of the teams
    func checkIfNamesAreDifferent(nameToBeChecked: String) -> Bool {
        return !Character.characterNames.contains(nameToBeChecked)

    }

}
