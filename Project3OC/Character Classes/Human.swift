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
        self.weapon = ThinSword(name: "Thin Sword", damage: 120)
        if (self.gender == .female) {
            self.healthPoints = 475
        } else {
            self.healthPoints = 500
            self.weapon = Javelin(name: "Javelin", damage: 110)
        }
        print("Your character is ready to go!")
    }
}
