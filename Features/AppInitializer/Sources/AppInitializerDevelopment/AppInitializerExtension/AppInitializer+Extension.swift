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

extension AppInitializer {
    public func environmentSelectorView() -> some View {
        let dataManager = readDataManager()
        let themeManager = readThemeManager()
        
        let localDataStore = EnvironmentSelectorDataStore(dataManager: dataManager)
        let repository = EnvironmentSelectorRepository(localDataStore: localDataStore,
                                                       mapper: EnvironmentDTOToDomainModelMapper())
        let usecase = EnvironmentSelectorUsecase(repository: repository)
        let state = EnvironmentSelectorViewState()
        return EnvironmentSelectorView(viewModel: EnvironmentSelectorViewModel(usecase: usecase, state: state),
                                       state: state,
                                       themeManager: themeManager)
    }
}
