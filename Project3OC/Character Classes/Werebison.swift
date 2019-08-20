//
//  Werebison.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 18/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Cocoa

class Werebison: Character {

    override init(name: String, gender: Gender) {
        super.init(name: name, gender: gender)
        if (self.gender == .female) {
            self.healthPoints = 675
            self.weapon = Weapon(name: "Large Sword", damage: 150, type: "Basic")
        } else {
            self.healthPoints = 775
            self.weapon = Weapon(name: "Axe", damage: 140, type: "Basic")
        }
        self.type = "Werebison"
        print("Your character is ready to go!")
    }
}

