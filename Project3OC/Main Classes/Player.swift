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
        print("""
            Please choose your character's type :
            1 - Human:
                 475HP for male and 110 damage points
                 500HP for female and 120 damage points

            Humans might not possess as much healthpoints as the elves do nor do they possess the same amount of knowledge as the magicians but
            They can still hold their on in a battle. Out of all the races Humans possess the most balanced points between the damage
            They can inflict and how enduring they can be where their healthpoints are concerned.

            2 - Elf:

                450HP for male and 90 damage points
                750HP for female and 80 damage points

            Hearing their names would at first glance make one think they'd be fierce warrior but contrary to most everyone's beliefs;
            Having prioritized their knowledge, despite their high healthpoints, the elves represent the most underwhelming race as far as
            Physical prowess is concerned. Still despite this setback, they can prove to be quite useful in battle.

            3 - Magician:

                250HP for male
                500HP for female

                Both of them inflict 180 damage points

            Don't be fooled by the amounts of healthpoints the magicians have! They pack quit the punch.
            Intellectual monsters, the vast knowledge they possess have made them experts in all kind of magics.
            Their strength in magic still stand unrivaled amongst all the other races making them the fiercest of fighters.

            4 - Werebison:

                675HP for male and 140 damage points
                775HP for female and 150 damage points

            Believing in no one but themselves, the werebison have learned to count on nothing but the things they're good at.
            In their case, this came down to training to fight and they've honed their fighting skills generation after generation in a strict
            Spartan like military culture. The result? Despite not being as knowledgeable as the magicians, due to their increasingly high endurance
            which is even higher than that of the elves, the werebisons still managed to get  their fighting skills almost on par with that of the magicians.

""")
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
            print("\(index + 1) - \(character.name) has \(character.healthPoints) HP and has a weapon which can inflict \(character.weapon.damage) damage")
        }
        let choiceInt = GameTool.getUserChoice(message: "Please choose a number in accordance to the numbers displayed above.", range: (min: 1, max: 3))
                if (player.team.count >= choiceInt) && (choiceInt > 0) {
                    return player.team[choiceInt-1]
                } else {
                    print("Error please please choose a number that corresponds to the ones displayed above.")
        }
        return selectCharacter(in: player)
    }
}
