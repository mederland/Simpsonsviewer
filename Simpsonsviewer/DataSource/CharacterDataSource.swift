//
//  DuckDuckGoCharacterDataSource.swift
//  Simpsonsviewer
//
//  Created by Meder iZimov on 4/25/23.
//

import Foundation

protocol CharacterDataSourceProtocol {
    func fetchCharacters(completion: @escaping (FetchCharactersResult) -> Void)
}

class DuckDuckGoCharacterDataSource: CharacterDataSourceProtocol {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchCharacters(completion: @escaping (FetchCharactersResult) -> Void) {
        apiClient.get(endpoint: "https://api.duckduckgo.com/?q=simpsons+characters&format=json") { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    let relatedTopics = json["RelatedTopics"] as? [[String: Any]] ?? []
                    let characters = relatedTopics.compactMap { topic -> Character? in
                        guard let name = topic["Text"] as? String else { return nil }
                        let description = topic["Description"] as? String ?? ""
                        return Character(id: UUID().uuidString, name: name, description: description)
                    }
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

