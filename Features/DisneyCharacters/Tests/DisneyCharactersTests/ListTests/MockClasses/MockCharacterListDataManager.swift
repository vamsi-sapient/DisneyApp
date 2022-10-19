//
//  MockCharacterListDataManager.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 18/10/22.
//

import Foundation
import Core
import PromiseKit

@testable import DisneyCharacters

class MockCharacterListDataManager: CharacterListDataManagerProtocol {
    
    var characterListDTOModel:CharacterListDTOModel?
    var error: Error?
    
    func getCharactersList() -> Core.Response<DisneyCharacters.CharacterListDTOModel> {
        return Promise { promise in
            if let error = error {
                promise.reject(error)
            } else {
                if let characterListDTOModel = characterListDTOModel {
                    promise.fulfill(characterListDTOModel)
                } else {
                    promise.reject(DisneyError(message: "CharacterListDTOModel is nil"))
                }
            }
        }
    }
    
}
