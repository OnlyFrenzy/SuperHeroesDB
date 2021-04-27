//
//  Appearance.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 28.04.2021.
//

import Foundation

// MARK: - Appearance
struct Appearance: Codable {
    let gender, race: String?
    let height, weight: [String]?
    let eyeColor, hairColor: String?
}
