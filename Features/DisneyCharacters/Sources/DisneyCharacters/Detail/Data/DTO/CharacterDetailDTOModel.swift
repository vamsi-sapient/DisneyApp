//
//  EnvironmentDTOModel.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import Core

struct CharacterDetailDTOModel: BaseDTO {
    let _id: Int
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
