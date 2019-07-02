//
//  Magician.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 18/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Cocoa

class Magician: Character {
    override init(name: String, gender: Gender) {
        super.init(name: name, gender: gender)
        if (self.gender == .female) {
            self.healthPoints = 500
        } else {
            self.healthPoints = 250
        }
        self.weapon = Healing(name: "Healing", damage: 140)
        self.weapon = FireAttack(name: "Fire Attack", damage: 140)
        self.weapon = WaterAttack(name: "Water Attack", damage: 130)
        self.weapon = ElectricalAttack(name: "Electrical Attack", damage: 180)
        print("Your character is ready to go!")
    }
}
