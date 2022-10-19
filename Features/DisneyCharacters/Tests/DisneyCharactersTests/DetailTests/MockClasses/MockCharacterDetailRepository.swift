//
//  MockCharacterDetailRepository.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 18/10/22.
//

import Foundation
import PromiseKit
import Core

@testable import DisneyCharacters

class MockCharacterDetailRepository: CharacterDetailRepositoryProtocol {
    
    var characterDetailDTOModel:CharacterDetailDTOModel?
    var characterDetailDTOToDomainModelMapper:CharacterDetailDTOToDomainModelMapper?
    var error: Error?
    
    func getCharacterDetails(_ url: String) -> Response<CharacterDetailDomainModel> {
        return Promise { promise in
            if let error = error {
                promise.reject(error)
            } else {
                if let dtoModel = characterDetailDTOModel {
                    if let mapper = characterDetailDTOToDomainModelMapper {
                        guard let domainModel = mapper.transform(dto: dtoModel) as? CharacterDetailDomainModel else {
                            promise.reject(DisneyError(message: "Not able to transfer to the domain model"))
                            return
                        }
                        promise.fulfill(domainModel)
                    } else {
                        promise.reject(DisneyError(message: "CharacterDetailDTOToDomainModelMapper is nil"))
                    }
                                        
                } else {
                    promise.reject(DisneyError(message:"CharacterDetailDTOModel is nil"))
                }
            }
        }
    }
    
}
