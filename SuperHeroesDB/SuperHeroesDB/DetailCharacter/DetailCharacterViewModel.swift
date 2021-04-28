//
//  PersonInformationViewModel.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 25.04.2021.
//

import UIKit

protocol DetailListViewModelProtocol {
    
    func loadCharacters(completion: @escaping () -> Void)
    func didClickPowerAppearanceButton()
    func name() -> String
    func fullName() -> String
    func characterImage() -> String
    func buttonTitle() -> String
    var title: String { get }
}

class DetailCharacterViewModel: DetailListViewModelProtocol {
    
    private var pushPowerAndAppearanceHandler: ((Int) -> ())?
    private var characterId: Int
    var title: String = ""
    private let networkService: NetworkServiceProtocol
    private var character: DetailCharacter?
    
    internal init(characterId: Int, title: String, networkService: NetworkServiceProtocol, pushPowerAndAppearanceHandler: ((Int) -> ())? = nil) {
        self.pushPowerAndAppearanceHandler = pushPowerAndAppearanceHandler
        self.characterId = characterId
        self.title = title
        self.networkService = networkService
    }
    
    func loadCharacters(completion: @escaping () -> Void) {
        networkService.detailRequestLoad(id: characterId) { detailCharacter in
            self.character = detailCharacter
            completion()
        }
    }
    
    func didClickPowerAppearanceButton() {
        pushPowerAndAppearanceHandler?(characterId)
    }
    
    func name() -> String {
        return character?.name ?? ""
    }
    
    func fullName() -> String {
        return character?.biography?.fullName ?? ""
    }
    
    func characterImage() -> String {
        return character?.images?.lg ?? ""
    }
    
    func buttonTitle() -> String {
        return "Power & Appearance"
    }
}
