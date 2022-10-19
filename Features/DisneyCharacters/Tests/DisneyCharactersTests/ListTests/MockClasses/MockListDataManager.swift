//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 19/10/22.
//

import Foundation
import PromiseKit
import Core

@testable import DisneyCharacters

class MockListDataManager: DataManagerProtocol {
   
    var characterListDTOModel:CharacterListDTOModel?
    var error: Error?
    
    func storeTokens(authToken: String, refreshToken: String?) {
        
    }
    
    func setEnvironmentData(_ data: Core.EnvironmentData) {
        
    }
    
    func request<T>(_ type: T.Type, request: Core.DataRequest) -> Core.Response<T> where T : Decodable, T : Encodable  {
            return Promise { promise in
                if let error = error {
                    promise.reject(error)
                } else {
                    if let characterDetailDTOModel = characterListDTOModel {
                        promise.fulfill(characterDetailDTOModel as! T)
                    } else {
                        promise.reject(DisneyError(message: "CharacterListDTOModel is not available"))
                    }
                }
            }
        }
        
}
