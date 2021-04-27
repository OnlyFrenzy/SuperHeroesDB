//
//  ViewController.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 23.04.2021.
//

import UIKit

class PersonsListViewController: UIViewController {

    @IBOutlet private weak var downloadView: UIView!
    @IBOutlet private weak var personsTableView: UITableView!
    
    var viewModel: PersonsListViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadCharacters { dataSource in
            self.setupTableView(dataSource: dataSource)
        }
    }
    
    private func setupTableView(dataSource: PersonsListTableViewDataSource) {
        
        headerConfig()
        tableViewCellConfig()
        navigationItem.title = viewModel.title
        personsTableView.dataSource = dataSource
        personsTableView.delegate = dataSource
        personsTableView.reloadData()
        downloadView.isHidden = true
    }
    
    private func headerConfig() {
        let headerNib = UINib(nibName: viewModel.headerIdentifier, bundle: nil)
        personsTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: viewModel.headerIdentifier)
    }
    
    private func tableViewCellConfig() {
        let characterCellNib = UINib(nibName: CharacterTableViewCell.className, bundle: nil)
        personsTableView.register(characterCellNib, forCellReuseIdentifier: SuperHero.className)
    }
}

