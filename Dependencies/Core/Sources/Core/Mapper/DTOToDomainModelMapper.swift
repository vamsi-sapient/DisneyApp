//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation

public protocol DTOToDomainModelMapper {
    func transform(dto: BaseDTO) -> BaseDomainModel
}
