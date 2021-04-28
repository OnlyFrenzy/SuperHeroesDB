//
//  DefaultCoordinatort.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 26.04.2021.
//

import UIKit

class DefaultCoordinator: Coordinator {
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    private let navigationController: UINavigationController
    private let networkService: NetworkService
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.networkService = NetworkService(httpClient: HttpClient())
    }
    
    func start() {
        guard let viewController = storyboard.instantiateViewController(identifier: PersonsListViewController.className) as? PersonsListViewController else { assertionFailure("PersonsListViewController is nil"); return }
        
        let viewModel = PersonsListViewModel(networkService: networkService, pushDetailsHandler: { id in
            self.pushDetailViewController(id: id)
        })
        
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func pushDetailViewController(id: Int) {
        guard let detailViewController = storyboard.instantiateViewController(identifier: DetailCharacterViewController.className) as? DetailCharacterViewController else { assertionFailure("DetailCharacterViewController is nil"); return }
        let detailViewModel = DetailCharacterViewModel(characterId: id, title: "", networkService: networkService) { id in
            self.pushPowerAndAppearanceViewController(id: id)
        }
        
        detailViewController.viewModel = detailViewModel

        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    func pushPowerAndAppearanceViewController(id: Int) {
        guard let powerAppearanceViewController = storyboard.instantiateViewController(identifier: CharacterPowerAndAppearanceViewController.className) as? CharacterPowerAndAppearanceViewController else { assertionFailure("CharacterPowerAndAppearanceViewController is nil"); return }
        let powerAppearanceViewModel = PowerAppearanceViewModel(characterId: id, title: "", networkService: networkService)
        
        powerAppearanceViewController.viewModel = powerAppearanceViewModel

        navigationController.pushViewController(powerAppearanceViewController, animated: true)
    }
}
