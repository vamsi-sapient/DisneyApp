//
//  EnvironmentDTOToDomainModel.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import Core

public struct EnvironmentDTOToDomainModelMapper: DTOToDomainModelMapper {

    public init() {
        
    }
    
    public func transform(dto: BaseDTO) -> BaseDomainModel {
        var environments = [EnvironmentDomainData]()
        guard let dtoModel = dto as? EnvironmentDTOModel else {
            return EnvironmentDomainModel(environments: [EnvironmentDomainData]())
        }
        dtoModel.environments.forEach { element in
            environments.append(EnvironmentDomainData(name: element.name,
                                                      unauthURL: element.unauthURL,
                                                      authURL: element.authURL,
                                                      crmURL: element.crmURL,
                                                      authTokenHeader: element.authTokenHeader))
        }
        
        return EnvironmentDomainModel(environments: environments)
    }
}
