//
//  MockCharacterDetailDataManager.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 18/10/22.
//

import Foundation
import Core
import PromiseKit

@testable import DisneyCharacters

class MockCharacterDetailDataManager: CharacterDetailDataManagerProtocol {
  
    var characterDetailDTOModel:CharacterDetailDTOModel?
    var error: Error?
    
    func getCharacterDetails(_ url: String) -> Response<CharacterDetailDTOModel> {
       
        return Promise { promise in
            if let error = error {
                promise.reject(error)
            } else {
                if let characterDetailDTOModel = characterDetailDTOModel {
                    promise.fulfill(characterDetailDTOModel)
                } else {
                    promise.reject(DisneyError(message: "CharacterDetailDTOModel is nil"))
                }
            }
        }
        
    }
    
}
