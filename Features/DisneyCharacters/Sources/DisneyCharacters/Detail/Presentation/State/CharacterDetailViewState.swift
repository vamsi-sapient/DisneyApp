//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core

class CharacterDetailViewState: BaseStateObject {
    @Published var screenTitle: String = ""
    @Published var characterDetails = CharacterDetailUIData(id: 0, name: "",
                                                            imageUrl: nil, url: nil,
                                                            films: nil, shortFilms: nil,
                                                            tvShows: nil, videoGames: nil,
                                                            parkAttractions: nil,
                                                            allies: nil, enemies: nil)
}

struct CharacterDetailUIData {
    let id: Int
    let name: String
    let imageUrl: String?
    let url: String?
    let films: [String]?
    let shortFilms: [String]?
    let tvShows: [String]?
    let videoGames: [String]?
    let parkAttractions: [String]?
    let allies: [String]?
    let enemies: [String]?
}
