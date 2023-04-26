//
//  CharacterDetailView.swift
//  Simpsonsviewer
//
//  Created by Meder iZimov on 4/25/23.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        VStack {
            ScrollView{
            Spacer()
                Text(character.name )
                    .font(.title3)
                    .fontWeight(.ultraLight)
                    .padding()

            }
        }
        .navigationBarTitle(Text(character.name.split(separator: " ").first.map(String.init) ?? "" ), displayMode: .inline)
    }
}
