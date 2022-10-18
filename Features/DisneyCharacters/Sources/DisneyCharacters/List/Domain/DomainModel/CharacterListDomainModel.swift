//
//  EnvironmentDomainModel.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import Core

struct CharacterListDomainModel: BaseDomainModel {
    let characters: [CharacterDomainData]
}

struct CharacterDomainData: Codable {
    let id: Int
    let name: String
    let imageUrl: String?
    let url: String
    let films: [String]?
    let tvShows: [String]?
    let videoGames: [String]?
}

