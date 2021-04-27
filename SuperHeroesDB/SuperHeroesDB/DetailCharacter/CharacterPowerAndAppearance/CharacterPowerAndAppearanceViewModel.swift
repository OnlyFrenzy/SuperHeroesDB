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
    private let networkService: NetworkService
    private var appearanceCharacter: Appearance?
    private var powerStatsCharacter: PowerStats?
    
    internal init(characterId: Int, title: String, networkService: NetworkService, pushPowerAndAppearanceHandler: ((Int) -> ())? = nil) {
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
        let appearance = " Gender: \(String(appearanceCharacter?.gender ?? "-")) \n Race: \(String(appearanceCharacter?.race ?? "-")) \n Height: \(String(appearanceCharacter?.height?[1] ?? "-")) \n Weight: \(String(appearanceCharacter?.weight?[1] ?? "-")) \n Eye color: \(String(appearanceCharacter?.eyeColor ?? "-")) \n Heir Color: \(String(appearanceCharacter?.hairColor ?? "-"))"
        return appearance
    }
    
    func powerStats() -> String {
        let powerStats = " Intelligence: \(String(powerStatsCharacter?.intelligence ?? 0)) \n Strength: \(String(powerStatsCharacter?.strength ?? 0)) \n Speed: \(String(powerStatsCharacter?.speed ?? 0)) \n Durability: \(String( powerStatsCharacter?.durability ?? 0)) \n Power: \(String( powerStatsCharacter?.power ?? 0)) \n Combat: \(String( powerStatsCharacter?.combat ?? 0))"
        return powerStats
    }
}

