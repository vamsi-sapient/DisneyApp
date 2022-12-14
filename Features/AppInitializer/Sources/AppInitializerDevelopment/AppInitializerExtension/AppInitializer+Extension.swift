//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 15/10/2022.
//

import Foundation
import AppInitializer
import SwiftUI
import Core
import SharedDependencies
import DisneyUIKit

extension AppInitializer {
    public func environmentSelectorView(initialViewIdentifier: String) -> AnyView {
        let dataManager = readDataManager()
        let themeManager = readThemeManager()
        
        let environmentSelectordataManager = EnvironmentSelectorDataManager(dataManager: dataManager)
        let repository = EnvironmentSelectorRepository(dataManager: environmentSelectordataManager,
                                                       mapper: EnvironmentDTOToDomainModelMapper())
        let usecase = EnvironmentSelectorUsecase(repository: repository)
        let state = EnvironmentSelectorViewState()
        return AnyView(EnvironmentSelectorView(initialViewIdentifier: initialViewIdentifier,
                                               viewModel: EnvironmentSelectorViewModel(usecase: usecase, state: state),
                                               state: state,
                                               themeManager: themeManager))
    }
}
