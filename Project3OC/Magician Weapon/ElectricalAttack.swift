//
//  ElectricalAttack.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 26/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Cocoa

class ElectricalAttack: Weapon {
    override init(name: String, damage: Int, weaponType: String) {
        super.init(name: name, damage: damage, weaponType: weaponType)
        self.name = "Electrical Attack"
        self.damage = 180
    }
}
