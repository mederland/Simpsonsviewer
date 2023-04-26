//
//  CharacterListViewModel.swift
//  Simpsonsviewer
//
//  Created by Meder iZimov on 4/25/23.
//

import Foundation
import Combine

class CharacterListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var searchText = ""
    private var disposables = Set<AnyCancellable>()
    
    @Published var isLoading = false
    
    private let characterRepository: CharacterRepositoryProtocol
    
    init(characterRepository: CharacterRepositoryProtocol) {
        self.characterRepository = characterRepository
    }
    
    func fetchCharacters() {
        isLoading = true
        
        characterRepository.fetchCharacters { result in
            DispatchQueue.main.async {
                self.isLoading = false
            switch result {
            case .success(let characters):
                self.characters = characters
            case .failure(let error):
                print("Error fetching characters: \(error.localizedDescription)")
            }
          }
        }
    }
    
    var filteredCharacters: [Character] {
        if searchText.isEmpty {
            return characters
        } else {
            return characters.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
}
