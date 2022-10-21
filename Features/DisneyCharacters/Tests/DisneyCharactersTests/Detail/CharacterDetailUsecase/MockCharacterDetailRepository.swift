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

struct MockCharacterDetailRepository: CharacterDetailRepositoryProtocol {
    private let dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func getCharacterDetails(_ url: String) -> Response<CharacterDetailDomainModel> {
        return dataManager.request(CharacterDetailDomainModel.self, request: DataRequest(path: url))
    }
}
