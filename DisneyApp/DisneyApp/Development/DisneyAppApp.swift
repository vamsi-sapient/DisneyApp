//
//  DisneyAppApp.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 06/10/2022.
//

import SwiftUI
import Core
import SharedDependencies
import DisneyCharacters
import AppInitializerDevelopment
import AppInitializer
import NetworkManager

@main
struct DisneyAppApp: App {
    
    fileprivate let appInitializer: AppInitializer
    
    init() {
        appInitializer = AppInitializer(themeManager: ThemeManager())
        registerDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            let localDataStore = EnvironmentSelectorDataStore(dataManager: appInitializer.readDataManager())
            let repository = EnvironmentSelectorRepository(localDataStore: localDataStore,
                                                           mapper: EnvironmentDTOToDomainModelMapper())
            let usecase = EnvironmentSelectorUsecase(repository: repository)
            let state = EnvironmentSelectorViewState()
            let view = EnvironmentSelectorView(viewModel: EnvironmentSelectorViewModel(usecase: usecase, state: state),
                                    state: state,
                                               themeManager: appInitializer.readThemeManager())
            appInitializer.body(view)
        }
    }
}
