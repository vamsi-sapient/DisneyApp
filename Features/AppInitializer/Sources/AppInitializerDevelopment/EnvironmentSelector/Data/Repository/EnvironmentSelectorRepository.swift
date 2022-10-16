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
    private let dataManager: EnvironmentSelectorDataManagerProtocol
    private let mapper: DTOToDomainModelMapper
    
    public init(dataManager: EnvironmentSelectorDataManagerProtocol, mapper: DTOToDomainModelMapper) {
        self.dataManager = dataManager
        self.mapper = mapper
    }
    
    public func getEnvironmentsList() -> Response<EnvironmentDomainModel> {
        return Promise { seal in
            dataManager.getEnvironmentsList().done {[weak self] dto in
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
    
    public func selectTheEnvironment(_ data: EnvironmentDomainData) {
        dataManager.selectTheEnvironment(EnvironmentData(name: data.name,
                                                         unauthURL: data.unauthURL,
                                                         authURL: data.authURL,
                                                         crmURL: data.crmURL))
    }
}
