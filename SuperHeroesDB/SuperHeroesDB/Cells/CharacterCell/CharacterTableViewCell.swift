//
//  CharacterTableViewCell.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 25.04.2021.
//

import Kingfisher
import UIKit

class CharacterTableViewCell: UITableViewCell, ConfigurableCellProtocol {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var portraitImageView: UIImageView!

    func configureWithCellConfigurator(model: CellConfiguratorProtocol) -> UITableViewCell {
        guard let characterModel = model as? SuperHero else { return self }
        titleLabel.text = characterModel.name
        portraitImageView.kf.setImage(with: URL(string: characterModel.portrait))
        return self
    }
}

class SuperHero: NSObject, CellConfiguratorProtocol {
    var selectionClosure: (() -> Void)?

    var name: String
    var portrait: String
    var id: Int

    init(name: String, portrait: String, id: Int) {
        self.name = name
        self.portrait = portrait
        self.id = id
    }
}

