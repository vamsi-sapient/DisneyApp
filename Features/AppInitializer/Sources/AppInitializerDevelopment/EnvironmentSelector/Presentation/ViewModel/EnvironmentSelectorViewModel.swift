//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI

public class EnvironmentSelectorViewModel: BaseViewModel, EnvironmentSelectorViewModelProtocol {
    private var state: EnvironmentSelectorViewState
    private let usecase: EnvironmentSelectorUsecaseProtocol
    private var environments: EnvironmentDomainModel?
    
    public init(usecase: EnvironmentSelectorUsecaseProtocol, state: EnvironmentSelectorViewState) {
        self.usecase = usecase
        self.state = state
        
        super.init()
    }
    
    public func getEnvironmentsList() {
        state.showProgress = true
        
        usecase.getEnvironmentsList().done { [weak self] data in
            self?.state.showProgress = false
            self?.environments = data
            var environmentTitles = [EnvironmentUIModel]()
            self?.environments?.environments.forEach { element in
                environmentTitles.append(EnvironmentUIModel(title: element.name.localizedUppercase))
            }
            self?.state.environmentTitles = environmentTitles
        }
        .catch { error in
            
        }
    }
    
    public func selectTheEnvironment(_ title: String) {
        guard let environments = self.environments?.environments,
              let environment = filterEnvironment(title, environments: environments) else {
            return
        }
        usecase.selectTheEnvironment(environment)
        state.selectedTitle = title
    }
    
    private func filterEnvironment(_ title: String, environments: [EnvironmentDomainData]) -> EnvironmentDomainData? {
        return environments.first {
            title.caseInsensitiveCompare($0.name) == .orderedSame
        }
    }
}
