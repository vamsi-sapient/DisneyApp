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
import AppInitializer
import AppInitializerDevelopment
import NetworkManager
import DisneyUIKit

@main
struct DisneyAppApp: App {
    private let appInitializer: AppInitializer
    private let themeManager: ThemeManagerProtocol

    init() {
        appInitializer = AppInitializer()
        themeManager = appInitializer.readThemeManager()
        registerDependencies(themeManager: themeManager,
                             dataManager: appInitializer.readDataManager())
    }
    
    var body: some Scene {
        WindowGroup {
            let view = appInitializer.environmentSelectorView(initialViewIdentifier: "\(ModuleNames.appInitializer.rawValue)_\(AppInitializerScreenConstants.welcome.rawValue)")
            AppInitializerView(themeManager: themeManager, initialView: view)
        }
    }
}
