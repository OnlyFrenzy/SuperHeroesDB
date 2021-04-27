//
//  ConfigurableCellProtocol.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 25.04.2021.
//

import UIKit

protocol ConfigurableCellProtocol {
    func configureWithCellConfigurator(model: CellConfiguratorProtocol) -> UITableViewCell
}
