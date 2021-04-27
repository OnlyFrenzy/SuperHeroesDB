//
//  NSObject+className.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 25.04.2021.
//

import Foundation

extension NSObject {
    static var className: String {
        String(describing: Self.self)
    }
}
