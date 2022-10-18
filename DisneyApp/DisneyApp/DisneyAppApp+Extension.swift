//
//  DisneyAppApp+Extension.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 15/10/2022.
//

import Foundation
import Core
import SharedDependencies
import DisneyCharacters
import AppInitializer
import DisneyUIKit

extension DisneyAppApp {
    func registerDependencies(themeManager: ThemeManagerProtocol,
                              dataManager: DataManagerProtocol) {
        registerAppInitializerModule()
        registerDisneyCharactersModule(themeManager: themeManager, dataManager: dataManager)
        NavigationManager.registerNavigationLinkProvider(featureName: ModuleNames.global.rawValue,
                                                         provider: GlobalNavigationProvider())
    }
}

// MARK: App Initializer Module
extension DisneyAppApp {
    fileprivate func registerAppInitializerModule() {
        NavigationManager.registerNavigationLinkProvider(featureName: ModuleNames.appInitializer.rawValue,
                                                         provider: AppInitializerNavigationProvider())
    }
}

// MARK: Disney Characters Module
extension DisneyAppApp {
    fileprivate func registerDisneyCharactersModule(themeManager: ThemeManagerProtocol,
                                                    dataManager: DataManagerProtocol) {
        let dependencyProvider = DisneyCharactersModuleDependencyProvider(dataManager: dataManager)
        
        DIContainer.registerModule(moduleName: ModuleNames.disneyCharacters.rawValue,
                                   provider: dependencyProvider)
        NavigationManager.registerNavigationLinkProvider(featureName: ModuleNames.disneyCharacters.rawValue,
                                                         provider: DisneyCharacterNavigationProvider(themeManager: themeManager,
                                                                                                     dependencyProvider: dependencyProvider))
    }
}
