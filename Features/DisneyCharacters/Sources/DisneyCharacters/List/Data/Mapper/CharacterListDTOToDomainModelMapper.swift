//
//  EnvironmentDTOToDomainModel.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import Core

struct CharacterListDTOToDomainModelMapper: DTOToDomainModelMapper {

    public init() {
        
    }
    
    func transform(dto: BaseDTO) -> BaseDomainModel {
        var characters = [CharacterDomainData]()
        guard let dtoModel = dto as? CharacterListDTOModel else {
            return CharacterListDomainModel(characters: [CharacterDomainData]())
        }
        dtoModel.characters.forEach { element in
            characters.append(CharacterDomainData(id: element._id,
                                                  name: element.name,
                                                  imageUrl: element.imageUrl,
                                                  url: element.url,
                                                  films: element.films,
                                                  tvShows: element.tvShows,
                                                  videoGames: element.videoGames
                                                 )
                             )
        }
        
        return CharacterListDomainModel(characters: characters)
    }
}
