//
//  APIClientError.swift
//  Simpsonsviewer
//
//  Created by Meder iZimov on 4/25/23.
//

import Foundation

enum APIClientError: Error {
    case invalidURL
    case noData
}

protocol APIClientProtocol {
    func get(endpoint: String, completion: @escaping (Result<Data, Error>) -> Void)
}

class APIClient: APIClientProtocol {
    static let shared = APIClient()
    func get(endpoint: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: endpoint) else {
            completion(.failure(APIClientError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIClientError.noData))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}
