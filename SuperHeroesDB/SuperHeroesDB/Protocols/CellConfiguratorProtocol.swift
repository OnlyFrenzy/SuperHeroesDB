//
//  CellConfiguratorProtocol.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 25.04.2021.
//

import Foundation

protocol CellConfiguratorProtocol: NSObject {
    var cellIdentifier: String { get }
    var selectionClosure: (() -> Void)? { get set }
}

extension CellConfiguratorProtocol {
    var cellIdentifier: String {
        return Self.className
    }

    var selectionClosure: (() -> Void)? {
        return nil
    }
}
