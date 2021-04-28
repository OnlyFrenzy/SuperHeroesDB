//
//  NetworkService.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 25.04.2021.
//

import Alamofire
import Foundation

protocol NetworkServiceProtocol {
    func requestLoad(completion: @escaping ([Character]) -> Void)
    func detailRequestLoad(id: Int, completion: @escaping (DetailCharacter) -> Void)
    func powerStatsRequestLoad(id: Int, completion: @escaping (PowerStats) -> Void)
    func appearanceRequestLoad(id: Int, completion: @escaping (Appearance) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    private let httpClient: HttpClient
    
    internal init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }
    
    func requestLoad(completion: @escaping ([Character]) -> Void) {
        guard let url = URL(string: (Router.personsURLString.rawValue)) else { return }
        httpClient.request(url: url, decodeType: CharacterResponse.self, completion: completion)
    }
    
    func detailRequestLoad(id: Int, completion: @escaping (DetailCharacter) -> Void) {
        guard let url = URL(string: Router.personInformationURLString.link(with: id)) else { return }
        httpClient.request(url: url, decodeType: DetailCharacter.self, completion: completion)
    }
    
    func powerStatsRequestLoad(id: Int, completion: @escaping (PowerStats) -> Void) {
        guard let url = URL(string: Router.personPowerURLString.link(with: id)) else { return }
        httpClient.request(url: url, decodeType: PowerStats.self, completion: completion)
    }
    
    func appearanceRequestLoad(id: Int, completion: @escaping (Appearance) -> Void) {
        guard let url = URL(string: Router.personAppearanceURLString.link(with: id)) else { return }
        httpClient.request(url: url, decodeType: Appearance.self, completion: completion)
    }
}

enum Router: String {
    case personsURLString = "https://akabab.github.io/superhero-api/api/all.json"
    case personInformationURLString = "https://akabab.github.io/superhero-api/api/id/"
    case personPowerURLString = "https://akabab.github.io/superhero-api/api/powerstats/"
    case personAppearanceURLString = "https://akabab.github.io/superhero-api/api/appearance/"
    
    func link(with id: Int) -> String {
        switch self {
        case .personAppearanceURLString,
             .personInformationURLString,
             .personPowerURLString:
            var finalLink = self.rawValue
            finalLink.append("\(id).json")
            return finalLink
        case .personsURLString:
            assertionFailure("not use id")
            return self.rawValue
        }
    }
}

