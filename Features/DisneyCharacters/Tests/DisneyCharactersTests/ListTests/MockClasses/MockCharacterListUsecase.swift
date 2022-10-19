//
//  MockCharacterListUsecase.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 18/10/22.
//

import Foundation
import Core
import PromiseKit

@testable import DisneyCharacters

class MockCharacterListUsecase: CharacterListUsecaseProtocol {

    var characterListDomainModel:CharacterListDomainModel?
    var error: Error?
    
    func getCharactersList() -> Core.Response<DisneyCharacters.CharacterListDomainModel> {
        return Promise { promise in
            if let error = error {
                promise.reject(error)
            } else {
                if let domainModel = characterListDomainModel {
                    promise.fulfill(domainModel)
                } else {
                    promise.reject(DisneyError(message: "CharacterListDomainModel is not available"))
                }
            }
        }
    }
}
