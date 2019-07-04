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

    private func getGenderCharacter() -> Character.Gender {
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
        return getGenderCharacter()
    }

    private func getCharacterType() -> String {
        print("""
            Please choose your character's type :
            1 - Human :
                475 to 500 HP depending on gender
                110 or 120 damage points given depending on the gender specific weapon

            2 - Elf :
                450 to 700 HP depending on gender
                default damage points given is 50 but the elf also has gender specific weapons with increased damage depending on gender

            3 - Magician :
                250 to 500 HP depending on gender
                Three magical attacks ranging from 130 to 180 damage points

            4 - Werebison :
                675 to 775 HP depending on gender
                Two gender specific weapons of 140 and 150 damage points 110 or 120
""")
        if let type = readLine() {
            if let typeInt = Int(type) {
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
            }
        }
        return getCharacterType()
    }

    private func getCharacterName() -> String {
        print("Please enter a name for your character")
        if let name = readLine() {
            return name
        }
        return getCharacterName()
    }

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



    func createTeam() {
        repeat {
            let type = getCharacterType()
            let gender = getGenderCharacter()
            let name = getCharacterName()
            let character = setCharacter(name: name, type: type, gender: gender)
            print("Please add a member to your team.")
            team.append(character)
        } while team.count < 3
        print("Your team is ready to go.")
        print("Your team is made up of \(team[0].name), \(team[1].name), \(team[2].name)")
    }

    func charactersDies() {
        for teammates in team {
            if teammates.healthPoints <= 0 {
                team.remove(at: Int(Character))
                print("Your character just died. You now have \(team.count) character still able to fight in your team")
            } else {
                print("Nothing significant to mention as of yet")
            }
        }
    }


}
