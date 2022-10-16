//
//  EnvironmentDTOModel.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import Core

struct CharacterListDTOModel: BaseDTO {
    let characters: [CharacterDTOData]
    
    private enum CodingKeys : String, CodingKey {
        case characters = "data"
    }
}

struct CharacterDTOData: Codable {
    let _id: Int
    let name: String
    let imageUrl: String?
    let url: String?
    let films: [String]?
    let tvShows: [String]?
    let videoGames: [String]?
}
