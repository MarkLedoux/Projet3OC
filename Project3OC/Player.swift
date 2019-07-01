//
//  Players.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 05/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Foundation

class Player {
    var name = ""
    var team = [Character]()

    init(name: String) {
        self.name = name
    }
    func checkIfNamesAreDifferent() {
        if player1.name == player2.name {
            print("You cannot have similar names, please choose a different name.")
            player2 = Player(name: readLine()!)
        } else {
            print("Well done on choosing your names.")
        }
    }

    func createTeam() {
        repeat {
            print("Please add another member to your team.")
            team.append(Character(name: readLine()!, gender: .female))
        } while team.count < 3
        print("Your team is ready to go.")
        print("Your team is made up of \(team[0].name), \(team[1].name), \(team[2].name)")
    }
}
