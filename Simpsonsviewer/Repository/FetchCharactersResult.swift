//
//  CharacterRepositoryImpl.swift
//  Simpsonsviewer
//
//  Created by Meder iZimov on 4/25/23.
//

import Foundation

enum FetchCharactersResult {
    case success([Character])
    case failure(Error)
}

protocol CharacterRepositoryProtocol {
    func fetchCharacters(completion: @escaping (FetchCharactersResult) -> Void)
}

class CharacterRepository: CharacterRepositoryProtocol {
    private let dataSource: CharacterDataSourceProtocol
    
    init(dataSource: CharacterDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func fetchCharacters(completion: @escaping (FetchCharactersResult) -> Void) {
        dataSource.fetchCharacters { result in
            switch result {
            case .success(let characters):
                completion(.success(characters))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
