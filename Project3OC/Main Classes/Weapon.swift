//
//  Weapon.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 20/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Cocoa

class Weapon {
    // MARK: Properties for the weapons used in the game
    var name: String
    var damage: Int
    var type: String

    init(name: String, damage: Int, type: String) {
        self.name = name
        self.damage = damage
        self.type = type
    }
}

