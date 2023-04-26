//
//  CharacterCell.swift
//  Simpsonsviewer
//
//  Created by Meder iZimov on 4/25/23.
//

import SwiftUI

struct CharacterCell: View {
    let character: Character
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(getFirstName())
                .font(.headline)
            Text(getLastName())
                .font(.headline)
        }
    }
    
    private func getFirstName() -> String {
        let fullName = character.name
        let firstName = fullName.split(separator: " ").first.map(String.init) ?? ""
        return firstName
    }
    
    private func getLastName() -> String {
        let fullName = character.name
        let words = fullName.split(separator: " ")
        var lastName = ""
        
        if words.count >= 2 && !["and", "-", "&", ",", "the"].contains(words[1].lowercased()) {
            lastName = String(words[1])
        }
        
        if words.count >= 3 && !["and", "-", "&", ",", "the"].contains(words[2].lowercased()) {
            lastName += " " + String(words[2])
        }
        
        if words.count >= 4 && ["and", "-", "&", ",", "the"].contains(words[2].lowercased()) {
            lastName += " " + String(words[3])
        }
        
        return lastName
    }
}

