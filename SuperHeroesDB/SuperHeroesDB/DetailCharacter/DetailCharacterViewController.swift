//
//  PersonInformationViewController.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 25.04.2021.
//

import UIKit

class DetailCharacterViewController: UIViewController {
    
    @IBOutlet private weak var downloadView: UIView!
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var powerAppearanceButton: UIButton!
    
    var viewModel: DetailListViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadCharacters {
            self.configure()
        }
    }
    
    private func configure() {
        nameLabel.text = viewModel.name()
        powerAppearanceButton.setTitle("Power & Appearance", for: .normal)
        fullNameLabel.text = viewModel.fullName()
        characterImageView.kf.setImage(with: URL(string: viewModel.characterImage()))
        powerAppearanceButton.addTarget(self, action: #selector(didClickPowerAppearanceButton), for: .touchUpInside)
        downloadView.isHidden = true
    }
    
    @objc
    private func didClickPowerAppearanceButton() {
        viewModel.didClickPowerAppearanceButton()
    }
}
