//
//  ContentView.swift
//  Simpsonsviewer
//
//  Created by Meder iZimov on 4/25/23.
//

import SwiftUI

struct CharacterListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SimpsonView()
    }
}
