//
//  CharacterPowerAndAppearanceViewController.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 23.04.2021.
//

import UIKit

protocol PowerAppearanceViewModelProtocol {
    
    func loadAppearance(completion: @escaping () -> Void)
    func loadPowerStats(completion: @escaping () -> Void)
    func didClickPowerAppearanceButton()
    func appearance() -> String
    func powerStats() -> String
}

class PowerAppearanceViewModel: PowerAppearanceViewModelProtocol {
    
    private var pushPowerAndAppearanceHandler: ((Int) -> ())?
    private var characterId: Int
    var title: String = ""
    private let networkService: NetworkServiceProtocol
    private var appearanceCharacter: Appearance?
    private var powerStatsCharacter: PowerStats?
    
    internal init(characterId: Int, title: String, networkService: NetworkServiceProtocol, pushPowerAndAppearanceHandler: ((Int) -> ())? = nil) {
        self.pushPowerAndAppearanceHandler = pushPowerAndAppearanceHandler
        self.characterId = characterId
        self.title = title
        self.networkService = networkService
    }
    
    func loadAppearance(completion: @escaping () -> Void) {
        networkService.appearanceRequestLoad(id: characterId) { appearanceCharacter in
            self.appearanceCharacter = appearanceCharacter
            completion()
        }
    }
    
    func loadPowerStats(completion: @escaping () -> Void) {
        networkService.powerStatsRequestLoad(id: characterId) { powerStatsCharacter in
            self.powerStatsCharacter = powerStatsCharacter
            completion()
        }
    }
    
    func didClickPowerAppearanceButton() {
        pushPowerAndAppearanceHandler?(characterId)
    }
    
    func appearance() -> String {
        let gender = "Gender: \(String(appearanceCharacter?.gender ?? "-"))"
        let race = "Race: \(String(appearanceCharacter?.race ?? "-"))"
        let height = "Height: \(String(appearanceCharacter?.height?[1] ?? "-"))"
        let weight = "Weight: \(String(appearanceCharacter?.weight?[1] ?? "-"))"
        let eyeColor = "Eye color: \(String(appearanceCharacter?.eyeColor ?? "-"))"
        let heirColor = "Heir Color: \(String(appearanceCharacter?.hairColor ?? "-"))"
        let appearance = "\(gender)\n\(race)\n\(height)\n\(weight)\n\(eyeColor)\n\(heirColor)"
        return appearance
    }
    
    func powerStats() -> String {
        let intelligence = "Intelligence: \(String(powerStatsCharacter?.intelligence ?? 0))"
        let strength = "Strength: \(String(powerStatsCharacter?.strength ?? 0))"
        let speed = "Speed: \(String(powerStatsCharacter?.speed ?? 0))"
        let durability = "Durability: \(String( powerStatsCharacter?.durability ?? 0))"
        let power = "Power: \(String( powerStatsCharacter?.power ?? 0))"
        let combat = "Combat: \(String( powerStatsCharacter?.combat ?? 0))"
        let powerStats = "\(intelligence)\n\(strength)\n\(speed)\n\(durability)\n\(power)\n\(combat)"
        return powerStats
    }
}

