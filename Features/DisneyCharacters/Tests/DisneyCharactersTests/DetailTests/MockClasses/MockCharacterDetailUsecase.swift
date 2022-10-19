//
//  MockCharacterDetailUsecase.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 18/10/22.
//

import Foundation
import Core
import PromiseKit

@testable import DisneyCharacters

class MockCharacterDetailUsecase: CharacterDetailUsecaseProtocol {

    var characterDetailDomainModel:CharacterDetailDomainModel?
    var error: Error?
    
    func getCharacterDetails(_ url: String) -> Core.Response<DisneyCharacters.CharacterDetailDomainModel> {

        return Promise { promise in
            if let error = error {
                promise.reject(error)
            } else {
                if let domainModel = characterDetailDomainModel {
                    promise.fulfill(domainModel)
                } else {
                    promise.reject(DisneyError(message: "CharacterDetailDomainModel is not available"))
                }
            }
        }
    }
}
