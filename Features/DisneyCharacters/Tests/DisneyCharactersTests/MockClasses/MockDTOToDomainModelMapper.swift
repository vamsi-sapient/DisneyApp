//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 20/10/2022.
//

import Foundation
import Core

struct MockDTOToDomainModelMapper: DTOToDomainModelMapper {
    
    func transform(dto: BaseDTO) -> BaseDomainModel {
        return MockDomainModel()
    }
}
