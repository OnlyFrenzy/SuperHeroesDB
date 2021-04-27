//
//  DetailCharacter.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 28.04.2021.
//

import Foundation

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
