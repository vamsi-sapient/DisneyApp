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

public class EnvironmentSelectorRepository: EnvironmentSelectorRepositoryProtocol {
    private let localDataStore: EnvironmentSelectorDataStoreProtocol
    private let mapper: DTOToDomainModelMapper
    
    public init(localDataStore: EnvironmentSelectorDataStoreProtocol, mapper: DTOToDomainModelMapper) {
        self.localDataStore = localDataStore
        self.mapper = mapper
    }
    
    public func getEnvironmentsList() -> Response<EnvironmentDomainModel> {
        return Promise { seal in
            localDataStore.getEnvironmentsList().done {[weak self] dto in
                guard let weakself = self else {
                    seal.reject(DisneyError(message: "Instance is destroyed"))
                    return
                }
                guard let domainModel = weakself.mapper.transform(dto: dto) as? EnvironmentDomainModel else {
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
