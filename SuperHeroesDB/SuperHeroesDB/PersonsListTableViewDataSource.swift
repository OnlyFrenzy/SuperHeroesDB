//
//  PersonsListTableViewDataSource.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 25.04.2021.
//

import UIKit

struct SectionModel {
    var sectionName: HeaderConfiguratorProtocol
    var sectionCells: [CellConfiguratorProtocol]
    var sectionStage: Bool

    internal init(sectionName: HeaderConfiguratorProtocol, sectionCells: [CellConfiguratorProtocol]) {
        self.sectionName = sectionName
        self.sectionCells = sectionCells
        sectionStage = true
    }
}

class PersonsListTableViewDataSource: NSObject {
    private var models: [SectionModel]
    private var headerModels: String
    private var sectionStage: Bool

    internal init(models: [SectionModel], headerModels: String, sectionStage: Bool) {
        self.models = models
        self.headerModels = headerModels
        self.sectionStage = sectionStage
    }
}

extension PersonsListTableViewDataSource: UITableViewDataSource {
    
    func numberOfSections(in _: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        if models[section].sectionStage {
            return models[section].sectionCells.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].sectionCells[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) as? ConfigurableCellProtocol {
            return cell.configureWithCellConfigurator(model: model)
        }
        return UITableViewCell()
    }
}

extension PersonsListTableViewDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let model = models[section].sectionName
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerModels) as? ConfigurableHeaderProtocol {
            header.setTurnButtonHandler { [weak self] (headerText: String, headerCount: Int) in
                guard let self = self else { return }
                let currentSection = headerCount
                print(currentSection)
                if self.models[section].sectionStage == true {
                    self.models[section].sectionStage = false
                } else {
                    self.models[section].sectionStage = true
                }
                tableView.reloadSections(IndexSet(integer: currentSection), with: .automatic)
            }
            return header.configureWithHeaderConfigurator(model: model)
        }
        return UITableViewHeaderFooterView()
    }
    
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = models[indexPath.section].sectionCells[indexPath.row]
        model.selectionClosure?()
    }
}
