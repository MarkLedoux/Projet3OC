//
//  CombinedElementalAttack.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 27/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Cocoa

class CombinedElementalAttack: Weapon {
    override init(name: String, damage: Int) {
        super.init(name: name, damage: damage)
        self.name = "Combined Elemental Attack"
        self.damage = 400
    }
}
