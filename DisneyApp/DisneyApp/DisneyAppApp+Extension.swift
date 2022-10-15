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

extension DisneyAppApp {
    public func registerDependencies() {
        registerDisneyCharactersModule()
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
