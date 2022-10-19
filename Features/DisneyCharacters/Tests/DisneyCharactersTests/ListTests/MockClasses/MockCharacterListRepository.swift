//
//  MockCharacterListRepository.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 18/10/22.
//

import Foundation
import PromiseKit
import Core

@testable import DisneyCharacters

class MockCharacterListRepository: CharacterListRepositoryProtocol {
    
    var characterListDTOModel:CharacterListDTOModel?
    var characterListDTOToDomainModelMapper:CharacterListDTOToDomainModelMapper?
    var error: Error?
    
    func getCharactersList() -> Core.Response<DisneyCharacters.CharacterListDomainModel> {
        return Promise { promise in
            if let error = error {
                promise.reject(error)
            } else {
                if let dtoModel = characterListDTOModel {
                    if let mapper = characterListDTOToDomainModelMapper {
                        guard let domainModel = mapper.transform(dto: dtoModel) as? CharacterListDomainModel else {
                            promise.reject(DisneyError(message: "Not able to transfer to the domain model"))
                            return
                        }
                        promise.fulfill(domainModel)
                    } else {
                        promise.reject(DisneyError(message: "CharacterListDTOToDomainModelMapper is nil"))
                    }
                                        
                } else {
                    promise.reject(DisneyError(message:"CharacterListDTOModel is nil"))
                }
            }
        }
    }
    
}
