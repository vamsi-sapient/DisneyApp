//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 20/10/2022.
//

import Foundation
import Core
import PromiseKit

@testable import DisneyCharacters

struct MockCharacterListRepository: CharacterListRepositoryProtocol {
    private let dataManager: DataManagerProtocol
    private let fileName: String
    
    init(dataManager: DataManagerProtocol, fileName: String) {
        self.dataManager = dataManager
        self.fileName = fileName
    }
    
    func getCharactersList() -> Response<CharacterListDomainModel> {
        return dataManager.request(CharacterListDomainModel.self, request: DataRequest(path: fileName))
    }
}
