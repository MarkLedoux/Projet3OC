//
//  Human.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 18/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Cocoa

class Human: Character {
    override init(name: String, gender: Gender) {
        super.init(name: name, gender: gender)
        if (self.gender == .female) {
            self.healthPoints = 500
            self.weapon = Weapon(name: "Thin Sword", damage: 120, type: "Basic")
        } else {
            self.healthPoints = 475
            self.weapon = Weapon(name: "Javelin", damage: 110, type: "Basic")
        }
        self.type = "Human"
        print("Your character is ready to go!")
    }
}
