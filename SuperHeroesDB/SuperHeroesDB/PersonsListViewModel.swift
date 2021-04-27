//
//  MainViewModel.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 25.04.2021.
//

import Foundation

protocol PersonsListViewModelProtocol {
    func loadCharacters(completion: @escaping (PersonsListTableViewDataSource) -> Void)
    var headerIdentifier: String { get }
    var title: String { get }
}

class PersonsListViewModel: PersonsListViewModelProtocol{
    
    let title: String = "Characters"
    let headerIdentifier = String(describing: CustomHeaderTableViewCell.self)
    private let networkService: NetworkService
    private var dataSource: PersonsListTableViewDataSource!
    private var characters: [Character] = []
    private var pushDetailsHandler: ((Int) -> ())?
    
    internal init(networkService: NetworkService, pushDetailsHandler: ((Int) -> ())? = nil) {
        self.networkService = networkService
        self.pushDetailsHandler = pushDetailsHandler
    }
    
    func loadCharacters(completion: @escaping (PersonsListTableViewDataSource) -> Void) {
        
        networkService.requestLoad( completion: { characters in
            self.characters = characters
            let models = self.configureCharactersModels()
            let sectionStage = true
            self.dataSource = PersonsListTableViewDataSource(models: models, headerModels: self.headerIdentifier, sectionStage: sectionStage)
            completion(self.dataSource)
        })
    }
    
    private func configureCharactersModels() -> [SectionModel] {
        
        var charactersModels: [SectionModel] = []
        var sectionCharacters: [CellConfiguratorProtocol] = []
        for index in 0 ..< characters.count {
            let character = SuperHero(name: characters[index].name!, portrait: characters[index].images!.lg!, id: characters[index].id!)
            character.selectionClosure = { [weak self] in
                self?.pushDetailsHandler?(character.id)
            }
            sectionCharacters.append(character)
        }
        charactersModels.append(SectionModel(sectionName: Header(headerCount: 0, headerIdentifier: "Characters"), sectionCells: sectionCharacters))
        return charactersModels
    }
}
