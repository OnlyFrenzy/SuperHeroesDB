//
//  Powerstats.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 28.04.2021.
//

import Foundation

// MARK: - PowerStats
struct PowerStats: Codable {
    let intelligence, strength, speed, durability: Int?
    let power, combat: Int?
}
