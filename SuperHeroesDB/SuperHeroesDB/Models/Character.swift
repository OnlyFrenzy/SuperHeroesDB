

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
