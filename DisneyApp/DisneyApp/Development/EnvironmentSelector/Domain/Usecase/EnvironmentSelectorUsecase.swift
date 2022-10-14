//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI

class EnvironmentSelectorUsecase: EnvironmentSelectorUsecaseProtocol {
    private let repository: EnvironmentSelectorRepositoryProtocol
    
    init(repository: EnvironmentSelectorRepositoryProtocol) {
        self.repository = repository
    }
    
    func getEnvironmentsList() -> Response<EnvironmentDomainModel> {
        return repository.getEnvironmentsList()
    }
}
