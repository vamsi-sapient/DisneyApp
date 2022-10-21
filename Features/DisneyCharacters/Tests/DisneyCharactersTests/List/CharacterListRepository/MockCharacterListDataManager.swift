//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 20/10/2022.
//

import Foundation
import Core
import NetworkManager

@testable import DisneyCharacters

struct MockCharacterListDataManager: CharacterListDataManagerProtocol {
    private let dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func getCharactersList() -> Response<CharacterListDTOModel> {
        return dataManager.request(CharacterListDTOModel.self,
                                   request: DataRequest(path: ""))
    }
}
