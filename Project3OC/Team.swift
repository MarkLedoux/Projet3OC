//
//  Team.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 26/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Cocoa

class Team {
   var team = [Character]()
    func createTeam() {
        repeat {
        print(team.count)
        team.append(Character(name: "Mook", gender: .female))
        print("Please add another member to your team.")
        } while team.count < 3
        print("The team is ready to go.")
    }
}
