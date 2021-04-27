//
//  CharacterPowerAndAppearanceViewController.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 23.04.2021.
//

import UIKit

class CharacterPowerAndAppearanceViewController: UIViewController {
    
    @IBOutlet private weak var downloadView: UIView!
    @IBOutlet private weak var appearanceLabel: UILabel!
    @IBOutlet private weak var powerStatsLabel: UILabel!
    @IBOutlet private weak var appearanceTextView: UITextView!
    @IBOutlet private weak var powerStatsTextView: UITextView!
    
    var viewModel: PowerAppearanceViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        viewModel.loadAppearance {
            self.appearanceLabel.text = "Appearance"
            self.appearanceTextView.text = self.viewModel.appearance()
            dispatchGroup.leave()
            //            self.downloadView.isHidden = true
        }
        dispatchGroup.enter()
        viewModel.loadPowerStats {
            self.powerStatsLabel.text = "Power & Stats"
            self.powerStatsTextView.text = self.viewModel.powerStats()
            dispatchGroup.leave()
            //            self.downloadView.isHidden = true
        }
        
        dispatchGroup.notify(queue: DispatchQueue.main) {
            self.downloadView.isHidden = true
        }
    }
}
