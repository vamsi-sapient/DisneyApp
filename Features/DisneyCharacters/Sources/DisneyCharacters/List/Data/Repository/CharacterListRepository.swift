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

class CharacterListRepository: CharacterListRepositoryProtocol {
    private let dataManager: CharacterListDataManagerProtocol
    private let mapper: DTOToDomainModelMapper
    
    init(dataManager: CharacterListDataManagerProtocol, mapper: DTOToDomainModelMapper) {
        self.dataManager = dataManager
        self.mapper = mapper
    }
    
    func getCharactersList() -> Response<CharacterListDomainModel> {
        return Promise { seal in
            dataManager.getCharactersList().done {[weak self] dto in
                guard let weakself = self else {
                    seal.reject(DisneyError(message: "Instance is destroyed"))
                    return
                }
                guard let domainModel = weakself.mapper.transform(dto: dto) as? CharacterListDomainModel else {
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
