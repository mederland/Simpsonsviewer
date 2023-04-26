//
//  DuckDuckGoCharacterDataSource.swift
//  Simpsonsviewer
//
//  Created by Meder iZimov on 4/25/23.
//

import Foundation

enum FetchCharactersResult {
    case success([Character])
    case failure(Error)
}

protocol CharacterDataSourceProtocol {
    func fetchCharacters(completion: @escaping (FetchCharactersResult) -> Void)
}

class DuckDuckGoCharacterDataSource: CharacterDataSourceProtocol {
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchCharacters(completion: @escaping (FetchCharactersResult) -> Void) {
        apiClient.get(endpoint: "http://api.duckduckgo.com/?q=simpsons+characters&format=json") { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    let characters = (json["RelatedTopics"] as? [[String: Any]])?.map { topic in
                        return Character(id: UUID().uuidString, name: topic["Text"] as! String)
                    } ?? []
                    completion(.success(characters))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
