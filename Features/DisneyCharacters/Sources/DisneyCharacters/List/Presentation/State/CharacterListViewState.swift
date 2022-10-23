//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core

final class CharacterListViewState: BaseStateObject {
    @Published var characters = [CharacterUIData]()
    let defaultImage: String
    
    init(showProgress: Bool = false,
         characters: [CharacterUIData] = [CharacterUIData](),
         defaultImage: String = CharacterListViewConstants.defaultImage) {
        self.characters = characters
        self.defaultImage = defaultImage
        
        super.init(showProgress: showProgress)
    }
}

struct CharacterUIData: Identifiable {
    let id: Int
    let name: String
    let imageUrl: String?
    let url: String
    let films: [String]?
    let tvShows: [String]?
    let videoGames: [String]?
}
