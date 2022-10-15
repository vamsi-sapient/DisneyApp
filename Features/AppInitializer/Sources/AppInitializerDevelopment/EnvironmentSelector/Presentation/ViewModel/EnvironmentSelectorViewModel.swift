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
    private let state: EnvironmentSelectorViewState
    private let usecase: EnvironmentSelectorUsecaseProtocol
    private var environments: EnvironmentDomainModel?
    
    public init(usecase: EnvironmentSelectorUsecaseProtocol, state: EnvironmentSelectorViewState) {
        self.usecase = usecase
        self.state = state
        
        super.init()
    }
    
    public func getEnvironmentsList() {
        usecase.getEnvironmentsList().done { [weak self] data in
            self?.environments = data
            let environmentTitles = self?.environments?.environments.map {
                $0.name
            }
            
            if let environmentTitles = environmentTitles {
                self?.state.environmentTitles = environmentTitles
            }
        }
        .catch { error in
            
        }
    }
    
    func filterTitles() {
        
    }
}
