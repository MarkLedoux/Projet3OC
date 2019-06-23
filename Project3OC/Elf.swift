//
//  Elf.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 18/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Cocoa

class Elf: Character {
    override init(name: String, gender: Gender) {
        super.init(name: name, gender: gender)
        if (self.gender == .female) {
            self.healthPoints = 750
        } else {
            self.healthPoints = 450
        }
        print("Your character is ready to go!")
    }
}
