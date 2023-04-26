//
//  SearchBar.swift
//  Simpsonsviewer
//
//  Created by Meder iZimov on 4/26/23.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var searchText: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var searchText: String
        
        init(searchText: Binding<String>) {
            _searchText = searchText
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.searchText = searchText
        }
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(searchText: $searchText)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.autocorrectionType = .no
        searchBar.placeholder = "Search"
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = searchText
    }
}
