

import Foundation

// MARK: - Character
struct Character: Codable {
    let id: Int?
    let name: String?
    let images: Images?
}

struct Images: Codable {
    let xs, sm, md, lg: String?
}

typealias CharacterResponse = [Character]

// MARK: - DetailCharacter
struct DetailCharacter: Codable {
    let id: Int?
    let name, slug: String?
    let biography: Biography?
    let images: Images?
}

struct Biography: Codable {
    let fullName, alterEgos: String?
    let aliases: [String]?
    let placeOfBirth, firstAppearance, publisher, alignment: String?
}

struct DetailImages: Codable {
    let xs, sm, md, lg: String?
}

// MARK: - PowerStats
struct PowerStats: Codable {
    let intelligence, strength, speed, durability: Int?
    let power, combat: Int?
}

// MARK: - Appearance
struct Appearance: Codable {
    let gender, race: String?
    let height, weight: [String]?
    let eyeColor, hairColor: String?
}

