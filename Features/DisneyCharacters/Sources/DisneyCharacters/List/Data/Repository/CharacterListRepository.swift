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
import NetworkManager

struct CharacterListRepository: CharacterListRepositoryProtocol {
    private let dataManager: CharacterListDataManagerProtocol
    private let mapper: DTOToDomainModelMapper
    
    init(dataManager: CharacterListDataManagerProtocol, mapper: DTOToDomainModelMapper) {
        self.dataManager = dataManager
        self.mapper = mapper
    }
    
    func getCharactersList() -> Response<CharacterListDomainModel> {
        return Promise { seal in
            dataManager.getCharactersList().done { dto in
                guard let domainModel = self.mapper.transform(dto: dto) as? CharacterListDomainModel else {
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
