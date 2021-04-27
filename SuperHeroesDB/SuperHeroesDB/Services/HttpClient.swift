//
//  HttpClient.swift
//  SuperHeroesDB
//
//  Created by OnlyFrenzy on 27.04.2021.
//

import Foundation
import Alamofire

class HttpClient {
    
    func request<T: Codable> (url: URL, decodeType: T.Type, completion: @escaping (T) -> ()) {
        let request = Session.default.request(url, method: .get)
        request.responseData { (response) in
            guard let data = response.data else { assertionFailure("data is nil"); return}
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(result)
            } catch let error {
                print(error)
            }
        }
        .validate()
        request.resume()
    }
}
