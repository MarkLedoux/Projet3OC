//
//  Game.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 07/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Foundation
class Game {
    func dropEqualsRolls() -> Bool {
        let firstRoll = Int.random(in: 1...6)
        let secondRoll = Int.random(in: 1...6)
        print("\(firstRoll) \(secondRoll)")

        if firstRoll == 6 && secondRoll == 6 {
            print("You win!")

            return true
        }
        print("Better luck next time!")
        return false
    }

    
}
