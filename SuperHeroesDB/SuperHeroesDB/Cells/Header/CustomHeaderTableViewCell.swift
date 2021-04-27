//
//  CustomHeaderTableViewCell.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 25.04.2021.
//

import UIKit

class CustomHeaderTableViewCell: UITableViewHeaderFooterView, ConfigurableHeaderProtocol {
    
    @IBOutlet private var turnButton: UIButton!
    @IBOutlet private var titleLabel: UILabel!
    
    var turnButtonHandler: ((String, Int) -> Void)?

    func setTurnButtonHandler(handler: ((String, Int) -> Void)?) {
        turnButtonHandler = handler
    }

    var headerButton: UIButton?
    var headerCount: Int?

    func configureWithHeaderConfigurator(model: HeaderConfiguratorProtocol) -> UITableViewHeaderFooterView {
        titleLabel.text = model.headerIdentifier
        turnButton.addTarget(self, action: #selector(didClickTurnButton), for: .touchUpInside)
        return self
    }

    @objc
    func didClickTurnButton() {
        turnButtonHandler?(titleLabel.text ?? "", headerCount ?? 0 )
    }
}

struct Header: HeaderConfiguratorProtocol {
    
    var headerCount: Int
    var headerIdentifier: String
}
