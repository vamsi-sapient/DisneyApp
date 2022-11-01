//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI
import PromiseKit


struct CharacterDetailRepository: CharacterDetailRepositoryProtocol {
    private let dataManager: CharacterDetailDataManagerProtocol
    private let mapper: DTOToDomainModelMapper
    
    init(dataManager: CharacterDetailDataManagerProtocol, mapper: DTOToDomainModelMapper) {
        self.dataManager = dataManager
        self.mapper = mapper
    }
    
    func getCharacterDetails(_ url: String) -> Response<CharacterDetailDomainModel> {
        return Promise { seal in
            dataManager.getCharacterDetails(url).done { dto in
                guard let domainModel = self.mapper.transform(dto: dto) as? CharacterDetailDomainModel else {
                    seal.reject(DisneyError(message: "Not able to transfer to the domain model"))
                    return
                }
                seal.fulfill(domainModel)
            }
            .catch { error in
                seal.reject(error)
            }
        }
    }
}
