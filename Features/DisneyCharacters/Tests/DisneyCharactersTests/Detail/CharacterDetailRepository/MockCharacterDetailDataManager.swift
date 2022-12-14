//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 20/10/2022.
//

import Foundation
import Core


@testable import DisneyCharacters

struct MockCharacterDetailDataManager: CharacterDetailDataManagerProtocol {
    
    private let dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func getCharacterDetails(_ url: String) -> Response<CharacterDetailDTOModel> {
        return dataManager.request(CharacterDetailDTOModel.self, request: DataRequest(path: url))
    }
}
