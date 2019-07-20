//
//  Game.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 07/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Foundation
class Game {
    //roll of dice displayed as two random numbers between 1-6 and if the number fall on 6 the treasure box appears
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
    //looping the fight action TODO: refactor fight action
    func gameLoop() {

        }

    
}
