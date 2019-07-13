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
    var player = [Player]()

    init(name: String) {
        self.name = name
    }

    // MARK: Logic

    //return of a string for the player name and checking if the names are different through a boolean when naming the players at the beginning of the game
    func namePlayer() -> String {
        let name = readLine()

        var isInt: Bool {
            return Int(name!) != nil
        }
        let isUnique = checkIfNamesAreDifferent(nameToBeChecked: name!)

        if !isUnique || isInt {
        return namePlayer()
        }
        return name!.capitalized

    }

    //logic to check if the player names are different or not
    func checkIfNamesAreDifferent(nameToBeChecked: String) -> Bool {
        repeat {
            player.append(Player(name: ""))
        } while player.count < 2
        print("The players are \(player[0].name) and \(player[1].name)")

        for playerNames in player {
            if playerNames.capitalized == name.capitalized {
                print("This name is already taken, please choose another name!")
                return false
            }
        }
        player.append(Player(name: name))
        return true

}


    //asking the player to choose what gender he wants for his character and setting the possible choice to recognize uppercased and lowercased letters
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

    //letting the player choose which type he wants for his characters
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

    //finally, after choosing the gender and type of his character, the player is then asked to supply a name for the character he's creating
    private func getCharacterName() -> String {
        print("Please enter a name for your character")
        if let name = readLine() {
            return name
        }
        return getCharacterName()
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
            let gender = getGenderCharacter()
            let name = getCharacterName()
            let character = setCharacter(name: name, type: type, gender: gender)
            print("Please add a member to your team.")
            team.append(character)
        } while team.count < 3
        print("Your team is ready to go.")
        print("Your team is made up of \(team[0].name), \(team[1].name), \(team[2].name)")
    }

    //choosing the character the attacking player - first player -  wants to use to attack the other player
    func attackTargetForPlayer1(target: Character) -> Character {
        for _ in player2.team {
        if let target = readLine() {
            if let targetInt = Int(target) {
                switch targetInt {
                case 1 :
                    return player2.team[0]
                case 2 :
                    return player2.team[1]
                case 3 :
                    return player2.team[2]
                default :
                    print("An error has occured, please enter 1, 2 or 3")
                }

                }
            }
        }
        return attackTargetForPlayer1(target: target)
    }

    //setting the character the attacking player - second player - wants to use to attack the other player
    func attackTargetForPlayer2(target: Character) -> Character {
        for _ in player1.team {
            if let selectedCharacter = readLine() {
                if let selectedCharacterInt = Int(selectedCharacter) {
                    switch selectedCharacterInt {
                    case 1 :
                        return player1.team[0]
                    case 2 :
                        return player1.team[1]
                    case 3 :
                        return player1.team[2]
                    default :
                        print("An error has occured, please enter 1, 2 or 3")
                    }
                }
            }
            if let target = readLine() {
                if let targetInt = Int(target) {
                    switch targetInt {
                    case 1 :
                        return player1.team[0]
                    case 2 :
                        return player1.team[1]
                    case 3 :
                        return player1.team[2]
                    default :
                        print("An error has occured, please enter 1, 2 or 3")
                    }

                }
            }
        }
        return attackTargetForPlayer2(target: target)
    }

    //makes it possible to remove the character at the array's index where the character's HP are less or equal to zero
    func removeCharacterWhenDead() {
        
        for teammate in team {
            if teammate.healthPoints <= 0 {
                print("\(teammate.name) just died. From now on he'll be out of this fight.")
                let index = team.firstIndex(where: { $0 === teammate })
                print(index!)
                team.remove(at: index!)
                print("You now have \(team.count) character still able to fight in your team")
            }
        }
    }

}
