//
//  DragonScaleElvenSword.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 27/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Cocoa

class DragonScaleElvenSword: Weapon {
    override init(name: String, damage: Int, weaponType: String) {
        super.init(name: name, damage: damage, weaponType: weaponType)
        self.name = "Dragon Scale Elven Sword"
        self.damage = 300
    }

}
