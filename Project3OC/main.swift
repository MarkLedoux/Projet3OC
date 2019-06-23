//
//  main.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 05/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Foundation

var welcomeToGame = "Welcome to the Ultimate Fantasy Game!"
    print(welcomeToGame)

var character1 = Werebison(name: "Paula", gender: .female)
print("\(character1.name) has \(character1.healthPoints)")
var character2 = Magician(name: "Pierre", gender: .male)
print("\(character2.name) has \(character2.healthPoints)")

character1.attack(target: character2)
print("\(character2.name) has \(character2.healthPoints) HP left")
