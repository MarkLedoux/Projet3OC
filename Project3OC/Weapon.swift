//
//  Weapon.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 20/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Cocoa

class Weapon {
    var name: String
    var damage: Int

    init(name: String, damage: Int) {
        self.name = name
        self.damage = damage
    }
    

    var weaponNameAndDamage = ["Large Sword": 150, "Axe": 150, "Guns": 90, "Bow": 50, "Staff": 50, "Javelin": 110, "Thin Sword": 120, "Knives": 90]
    var magicalAttacksAndDamage = ["Fire Attack": 130, "Water Attack": 130, "Earth Attack": 125, "Air Attack": 120, "Healing": 130]

}

