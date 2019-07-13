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

}
