//
//  Magician.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 18/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Cocoa

class Magician: Character {
    var heal = 140
    override init(name: String, gender: Gender) {
        super.init(name: name, gender: gender)
        if (self.gender == .female) {
            self.healthPoints = 500
        } else {
            self.healthPoints = 250
        }
        self.weapon = Weapon(name: "Electrical Attack", damage: 180, type: "Basic")
        self.type = "Magician"
        print("Your character is ready to go!")
    }

    // healing for the magician, similar to attack, however the healthpoints get added to the existing healthpoints of the character. 
    func heal(target: Character) {
        if healthPoints > 0 {
            target.healthPoints += heal
            print("\(self.name) used Healing and healed \(target.name) by \(heal) points, now \(target.name) has \(target.healthPoints) HP left. ")
        } else {
            print("This character cannot be healed.")
        }

    }
}
