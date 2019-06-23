//
//  Characters.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 05/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Foundation

class Character {
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

    func attack(target: Character) {
        target.healthPoints -= self.weapon.damage
        print("\(self.name) inflicted \(self.weapon.damage) damage points to \(target.name), now \(target.name) only has \(target.healthPoints) HP left. ")
    }

}