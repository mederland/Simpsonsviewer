//
//  ContentView.swift
//  Simpsonsviewer
//
//  Created by Meder iZimov on 4/25/23.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel: CharacterListViewModel
    @State var isLoading = false
    var body: some View {
        GeometryReader { geo in
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 5)
            NavigationView {
                ZStack {
                    Image("Wall")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        .opacity(1.0)
                    if self.viewModel.isLoading {
                        VStack{
                            Text("Simpsons Characters")
                                .shadow(color: .black, radius: 30)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            ProgressView()
                                .scaleEffect(2.0)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation {
                                            self.viewModel.isLoading = false
                                        }
                                    }
                                }
                        }
                    } else {
                        content
                    }
                }
            }
            .padding(0)
        }
    }
    
    @ViewBuilder
    var content: some View {
        NavigationView {
            List(viewModel.filteredCharacters) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    CharacterCell(character: character)
                }
                .background(Color.yellow.opacity(0.18))
                .cornerRadius(6)
            }
            .navigationTitle(Text("Simpsons Characters"))
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
