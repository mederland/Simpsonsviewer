//
//  ContentView.swift
//  Simpsonsviewer
//
//  Created by Meder iZimov on 4/25/23.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel: CharacterListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.filteredCharacters) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    CharacterCell(character: character)
                }
            }
            .navigationTitle("Simpsons Characters")
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
        .onAppear {
            viewModel.fetchCharacters()
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(viewModel: CharacterListViewModel(characterRepository: CharacterRepository(dataSource: DuckDuckGoCharacterDataSource(apiClient: APIClient().self as APIClientProtocol))))
    }
}
