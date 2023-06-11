//
//  CharacterDetailView.swift
//  Simpsonsviewer
//
//  Created by Meder iZimov on 4/25/23.
//

import SwiftUI

struct CharacterDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    let character: Character
    
    var body: some View {
        VStack {
            VStack{
                ScrollView{
                Spacer()
                    Text(character.name )
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.ultraLight)
                        .padding()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .greatestFiniteMagnitude)
        .background(Color.yellow.opacity(0.99))
        .cornerRadius(24)
        .padding(.horizontal, 2)
        .padding(.bottom, 2)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text(character.name.split(separator: " ").first.map(String.init) ?? "" ), displayMode: .inline)
        .navigationBarItems(
            leading: EmptyView(),
            trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrow.uturn.backward.circle.fill")
                    .foregroundColor(.yellow)
                    .font(.title)
                    .shadow(color: .white, radius: 1)
            })
        )
    }
}
