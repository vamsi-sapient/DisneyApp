//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI

public class EnvironmentSelectorUsecase: EnvironmentSelectorUsecaseProtocol {
    private let repository: EnvironmentSelectorRepositoryProtocol
    
    public init(repository: EnvironmentSelectorRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getEnvironmentsList() -> Response<EnvironmentDomainModel> {
        return repository.getEnvironmentsList()
    }
    
    public func selectTheEnvironment(_ data: EnvironmentDomainData) {
        repository.selectTheEnvironment(data)
    }
}
