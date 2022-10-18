//
//  EnvironmentDTOToDomainModel.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import Core

struct CharacterDetailDTOToDomainModelMapper: DTOToDomainModelMapper {

    public init() {
        
    }
    
    func transform(dto: BaseDTO) -> BaseDomainModel {
        guard let element = dto as? CharacterDetailDTOModel else {
            return CharacterDetailDomainModel(id: 0, name: "",
                                              imageUrl: nil, url: "",
                                              films: nil, shortFilms: nil,
                                              tvShows: nil, videoGames: nil,
                                              parkAttractions: nil,
                                              allies: nil, enemies: nil)
        }
        return CharacterDetailDomainModel(id: element._id,
                                          name: element.name,
                                          imageUrl: element.imageUrl,
                                          url: element.url,
                                          films: element.films,
                                          shortFilms: nil,
                                          tvShows: element.tvShows,
                                          videoGames: element.videoGames,
                                          parkAttractions: nil,
                                          allies: nil, enemies: nil
                                         )
        
    }
}
