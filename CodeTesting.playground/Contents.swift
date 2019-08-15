import UIKit
class Character {
    // MARK: Properties
    enum Gender {
        case male, female
    }

    var type = "Character"
    var name = ""
    var healthPoints: Int
    var gender: Gender
    var weapon: Weapon
    static var characterNames = [String]()



    init(name: String, gender: Gender) {
        self.name = name
        self.healthPoints = 0
        self.gender = .male
        self.weapon = Weapon(name: "Large Sword", damage: 150, weaponType: "Basic")
    }
    // MARK: Logic

    //attacking the other's player's character and setting damage
    func attack(target: Character) {
        if healthPoints > 0 {
            target.healthPoints -= self.weapon.damage
            print("\(self.name) used \(self.weapon.name) and inflicted \(self.weapon.damage) damage points to \(target.name), now \(target.name) has \(target.healthPoints) HP left. ")
        } else {
            print("This character is already dead you cannot attack him anymore.")
        }

    }
}

class Elf: Character {

    override init(name: String, gender: Gender) {
        super.init(name: name, gender: gender)
        if (self.gender == .female) {
            self.healthPoints = 750
            self.weapon = Knife(name: "Knife", damage: 80, weaponType: "Basic")
        } else {
            self.healthPoints = 450
            self.weapon = Gun(name: "Gun", damage: 90, weaponType: "Basic")
        }
        self.type = "Elf"
        print("Your character is ready to go!")
    }
}


class Weapon {
    // MARK: Properties for the weapons used in the game
    var name: String
    var damage: Int
    var weaponType: String

    init(name: String, damage: Int, weaponType: String) {
        self.name = name
        self.damage = damage
        self.weaponType = weaponType
    }
}

class Knife: Weapon {
    override init(name: String, damage: Int, weaponType: String) {
        super.init(name: name, damage: damage, weaponType: weaponType)
        self.name = "Knife"
        self.damage = 80
    }
}

class Gun: Weapon {
    override init(name: String, damage: Int, weaponType: String) {
        super.init(name: name, damage: damage, weaponType: weaponType)
        self.name = "Gun"
        self.damage = 90
    }
}

//testing to change the character's weapons
func changeWeapon(character: Character) -> Weapon {
    // Initalise variable to change characters'weapon
    let weaponForMagician = Weapon(name: "", damage: 0, weaponType: "")
    let weaponForElf = Weapon(name: "", damage: 0, weaponType: "")
    let weaponForWerebison = Weapon(name: "", damage: 0, weaponType: "")
    let weaponForHuman = Weapon(name: "", damage: 0, weaponType: "")

    // Create Array of weapons
    let newWeapons = [
        Weapon(name: "Super Sword", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Javelin", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Thin Sword", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Knife", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Gun", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Axe", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Large Sword", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Dragon Scale Elven Sword", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Combined Elemental Attack", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Dagger", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Mace", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Scepter", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Pistol", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Sword", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Focus", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Shield", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Hammer", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Long Bow", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Rifle", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Short Bow", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Staff", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Harpoon Gun", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Spear", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Trident", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Earth Attack", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Fire Attack", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Water Attack", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Air Attack", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Dark Magic Attack", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Boulder Crush", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Cyclone", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Freeze Over", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Pyroclastic Explosion", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Magna Flow", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Sunburn", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Dark Conjuring", damage: Int.random(in: 0...25), weaponType: "Legendary")

    ]

    return changeWeapon(character: character)
}

print("""
Classes for weapons:
- Fine weapons will be stringer by 1.2 times
- Masterwork by 1.4 times
- Rare 1.6
- Exotic 1.8
- Ascended 2
- Legendary 2.5


Magician will only have access to six kinds of spells according to the same principles used for the weapons
""")
