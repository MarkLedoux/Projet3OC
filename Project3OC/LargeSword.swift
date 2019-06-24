//
//  LargeSword.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 24/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Cocoa

class LargeSword: Weapon {
    override init(name: String, damage: Int) {
        super.init(name: name, damage: damage)
            self.name = "Large Sword"
            self.damage = 150
    }
}
