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

extension DisneyAppApp {
    public func registerDependencies() {
        registerAppInitializerModule()
        registerDisneyCharactersModule()
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
    fileprivate func registerDisneyCharactersModule() {
        DIContainer.registerModule(moduleName: ModuleNames.disneyCharacters.rawValue,
                                   provider: DisneyCharactersModuleDependencyProvider())
        NavigationManager.registerNavigationLinkProvider(featureName: ModuleNames.disneyCharacters.rawValue,
                                                         provider: DisneyCharacterNavigationProvider())
    }
}
