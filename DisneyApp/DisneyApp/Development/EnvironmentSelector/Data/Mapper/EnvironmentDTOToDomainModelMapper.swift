//
//  EnvironmentDTOToDomainModel.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import Core

struct EnvironmentDTOToDomainModelMapper: DTOToDomainModelMapper {
    
    func transform(dto: BaseDTO) -> BaseDomainModel {
        var environments = [EnvironmentDomainData]()
        guard let dtoModel = dto as? EnvironmentDTOModel else {
            return EnvironmentDomainModel(environments: [EnvironmentDomainData]())
        }
        dtoModel.environments.forEach { element in
            environments.append(EnvironmentDomainData(name: element.name,
                                                      unauthURL: element.unauthURL,
                                                      authURL: element.authURL,
                                                      crmURL: element.crmURL))
        }
        
        return EnvironmentDomainModel(environments: environments)
    }
}
