//
//  Players.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 05/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Foundation

class Player {
    var name: String
    
    init(name:String) {
        self.name = name
    }
    
}

class Player1: Player {
    var player1 = Player(name: readLine()!)

}

class Player2: Player {
    var player2 = Player(name: readLine()!)
}
