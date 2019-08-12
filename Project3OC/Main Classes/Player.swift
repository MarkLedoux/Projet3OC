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
    var round = 1

    // MARK: Logic

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
            let gender = getGenderCharacter()
            let name = getCharacterName()
            let character = setCharacter(name: name, type: type, gender: gender)
            print("Please add a member to your team.")
            team.append(character)
        } while team.count < 3
        print("Your team is ready to go.")
        print("Your team is made up of \(team[0].name), \(team[1].name), \(team[2].name)")
    }

    //makes it possible to remove the character at the array's index where the character's HP are less or equal to zero
    func removeCharacterWhenDead() { //error when the first or second members in the array are taken out
        
        for teammate in team {
            if teammate.healthPoints <= 0 {
                print("\(teammate.name) just died. From now on he'll be out of this fight.") //TODO: change text to better reflect the changes that happen during the fight
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
    //make the players attack three times in a row

    
    func fightingLoop() {
        var attackingTeam = player1
        var defendingTeam = player2

        while player1.team.count >= 1 && player2.team.count >= 1 {
            print("It's time for round \(round)!")

            let attackingCharacter = attackingTeam.selectCharacter(in: attackingTeam)
            GameTool.dropEqualsRolls()

            if let magician = attackingCharacter as? Magician {
                let userAnswer = GameTool.getUserChoice(message: "Choose what you want your magician to do! 1: Attack or 2: Heal!", range: (min: 1, max: 2))
                    switch userAnswer {
                    case 1:
                        let defendingCharacter = attackingTeam.selectCharacter(in: defendingTeam)
                        attackingCharacter.attack(target: defendingCharacter)
                        defendingTeam.removeCharacterWhenDead()

                    case 2:
                        let healedCharacter = attackingTeam.selectCharacter(in: attackingTeam)
                        magician.heal(target: healedCharacter)

                    default:
                        print("Error, something wrong happened.")
                    }

            } else {
                let defendingCharacter = attackingTeam.selectCharacter(in: defendingTeam)
                attackingCharacter.attack(target: defendingCharacter)
                defendingTeam.removeCharacterWhenDead()
            }
            swap(&attackingTeam, &defendingTeam)
            round += 1

        }
        gameOver()

    }

    static func changeCharacterWeapon() {
        var attackingTeam = Player()

        let attackingCharacter = attackingTeam.selectCharacter(in: attackingTeam)

        if let magician = attackingCharacter as? Magician {
            attackingCharacter.self.weapon = CombinedElementalAttack(name: "Combined Elemental Attack", damage: 400)
        } else {
            attackingCharacter.self.weapon = DragonScaleElvenSword(name: "Dragon Scale Elven Sword", damage: 300)
        }
    }

    func gameWinner() {
        let winner: String
        if player1.team.count > player2.team.count {
            winner = player1.name
        } else {
            winner = player2.name
        }
        print("The game is now over. \(winner) has more members in his team and is therefore declared the winner of this game.")
    }

    func gameOver() {
        print("A total of \(round) rounds were played")
        gameWinner()
    }

}
