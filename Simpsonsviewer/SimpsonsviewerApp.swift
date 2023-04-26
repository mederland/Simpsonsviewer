//
//  SimpsonsviewerApp.swift
//  Simpsonsviewer
//
//  Created by Meder iZimov on 4/25/23.
//

import SwiftUI

@main
struct SimpsonsviewerApp: App {
    var viewModel: CharacterListViewModel
    
    init() {
        let characterRepository = CharacterRepository(dataSource: DuckDuckGoCharacterDataSource(apiClient: APIClient()))
        viewModel = CharacterListViewModel(characterRepository: characterRepository)
    }
    
    var body: some Scene {
        WindowGroup {
            CharacterListView(viewModel: viewModel)
        }
    }
}

