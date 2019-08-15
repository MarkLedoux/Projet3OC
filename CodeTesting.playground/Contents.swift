import UIKit


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

//testing to change the character's weapons
func changeWeapon(character: Character) -> Weapon {
    // Initalise variable previsouWeapon
    let weapon = Weapon(name: "", damage: 0, weaponType: "")

    // Create Array of weapons
    let newWeapons = [
        Weapon(name: "Super Sword", damage: Int.random(in: 0...25), weaponType: "Legendary"),
        Weapon(name: "Cartoon Sword", damage: Int(arc4random_uniform(6) + 1)),
        Weapon(name: "Sword", damage: 10),
        Weapon(name: "Super Mass", damage: Int(arc4random_uniform(21) + 10)),
        Weapon(name: "Cartoon Mass", damage: 1),
        Weapon(name: "Mass", damage: 5),
        Weapon(name: "Super Dagger", damage: Int(arc4random_uniform(31) + 20)),
        Weapon(name: "Cartoon Dagger", damage: Int(arc4random_uniform(5) + 5)),
        Weapon(name: "Dagger", damage: 15),
        Weapon(name: "Super Baton", damage: 0),
        Weapon(name: "Carton Baton", damage: 0),
        Weapon(name: "Baton", damage: 0),
    ]

    return changeWeapon(character: character)
}
