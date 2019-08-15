//
//  Players.swift
//  Project3OC
//
//  Created by Mark LEDOUX on 05/06/2019.
//  Copyright © 2019 Mark LEDOUX. All rights reserved.
//

import Foundation

class Player {

    // MARK: Properties
    var name = ""
    var team = [Character]()
    static var playerNames = [String]()

    // MARK: Logic

    //asking the player to choose what gender he wants for his character and setting the possible choice to recognize uppercased and lowercased letters
    private func getCharacterGender() -> Character.Gender {
        print("Please choose your character's gender: M for male / F for female.")
        if let gender = readLine() {
            let uppercasedGender = gender.uppercased()
            switch uppercasedGender {
            case "M":
                return .male
            case "F":
                return .female
            default:
                print("An error has occured, please enter either m/M or f/F")
            }
        }
        return getCharacterGender()
    }
    
    //letting the player choose which type he wants for his characters
    private func getCharacterType() -> String {
        GameTool.characterTypeIntro()
        
        let typeInt = GameTool.getUserChoice(message: "Please enter 1, 2, 3 or 4", range: (min:1, max: 4))
                switch typeInt {
                case 1 :
                    return "Human"
                case 2 :
                    return "Elf"
                case 3 :
                    return "Magician"
                case 4 :
                    return "Werebison"
                default :
                    print("An error has occured, please enter 1, 2, 3 or 4")
        }
        return getCharacterType()
    }

    //finally, after choosing the gender and type of his character, the player is then asked to supply a name for the character he's creating
    private func getCharacterName() -> String {
        print("Please enter a name for your character")
        return GameTool.naming()
    }

    //gathering all the data that was the input before in order to access it for the character's addition to the team
    private func setCharacter(name: String, type: String, gender: Character.Gender) -> Character {
        switch type {
        case "Human":
            return Human(name: name, gender: gender)
        case "Elf":
            return Elf(name: name, gender: gender)
        case "Magician":
            return Magician(name: name, gender: gender)
        case "Werebison":
            return Werebison(name: name, gender: gender)
        default:
            print("Error: something wrong happened")
        }
        return setCharacter(name: name, type: type, gender: gender)
    }

    //using the data gathered in the previous function, adding a character into an array until the array reaches a size of three on its index
    func createTeam() {
        repeat {
            let type = getCharacterType()
            let gender = getCharacterGender()
            let name = getCharacterName()
            let character = setCharacter(name: name, type: type, gender: gender)
            print("Please add a member to your team.")
            team.append(character)
        } while team.count < 3
        print("Your team is ready to go.")
        print("Your team is made up of \(team[0].name), \(team[1].name), \(team[2].name)")
    }

    //makes it possible to remove the character at the array's index where the character's HP are less or equal to zero
    func removeCharacterWhenDead() {
        for teammate in team {
            if teammate.healthPoints <= 0 {
                print("\(teammate.name) just died. \(teammate.name) is out of this fight.")
                let index = team.firstIndex(where: { $0 === teammate })
                team.remove(at: index!)
                print("You now have \(team.count) character still able to fight in your team")
            }
        }
    }

    //select character
    func selectCharacter(in player: Player) -> Character {
        print("Please choose a character among the characters in the following list.")
        for (index, character) in player.team.enumerated() {
            print("\(index + 1) - \(character.name) is a \(character.type), has \(character.healthPoints) HP and is equipped with a weapon that can inflict \(character.weapon.damage) damage using a \(character.weapon.weaponType) type of weapon.")
        }
        let choiceInt = GameTool.getUserChoice(message: "Please choose a number in accordance to the numbers displayed above.", range: (min: 1, max: 3))
                if (player.team.count >= choiceInt) && (choiceInt > 0) {
                    return player.team[choiceInt-1]
                } else {
                    print("Error please please choose a number that corresponds to the ones displayed above.")
        }
        return selectCharacter(in: player)
    }

    func displayTeam() {
        for (index, character) in self.team.enumerated() {
            print("\(index + 1) \(character.name) is a \(character.type), has \(character.healthPoints) HP and can inflict \(character.weapon.damage) damage using a \(character.weapon.name) which is a \(character.weapon.weaponType) type of weapon.")
        }
    }
}
