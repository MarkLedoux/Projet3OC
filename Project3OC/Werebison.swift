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
        } else {
            self.healthPoints = 775
        }
        self.weapon = LargeSword(name: <#T##String#>, damage: <#T##Int#>)
        print("Your character is ready to go!")
    }
}
