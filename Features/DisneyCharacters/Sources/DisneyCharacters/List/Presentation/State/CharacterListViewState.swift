//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core

class CharacterListViewState: BaseStateObject {
    @Published var characters = [CharacterUIData]()
    @Published var selectedItemURL = ""
}

struct CharacterUIData {
    let id: Int
    let name: String
    let imageUrl: String?
    let url: String?
    let films: [String]?
    let tvShows: [String]?
    let videoGames: [String]?
}
