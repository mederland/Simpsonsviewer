//
//  Character.swift
//  Simpsonsviewer
//
//  Created by Meder iZimov on 4/25/23.
//
import Foundation

struct Character: Identifiable {
    let id: String
    let name: String
    let description: String

    init(id: String = UUID().uuidString, name: String, description: String = "") {
        self.id = id
        self.name = name
        self.description = description
    }
}
