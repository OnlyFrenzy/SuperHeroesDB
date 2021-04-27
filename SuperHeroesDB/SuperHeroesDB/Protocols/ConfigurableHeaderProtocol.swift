//
//  ConfigurableHeaderProtocol.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 25.04.2021.
//

import UIKit

protocol ConfigurableHeaderProtocol {
    func configureWithHeaderConfigurator(model: HeaderConfiguratorProtocol) -> UITableViewHeaderFooterView
    func setTurnButtonHandler(handler: ((String, Int) -> Void)?)
}
