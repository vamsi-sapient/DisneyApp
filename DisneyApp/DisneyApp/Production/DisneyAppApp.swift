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
import NetworkManager
import DisneyUIKit

@main
struct DisneyAppApp: App {
    
    fileprivate let appInitializer: AppInitializer
    fileprivate let themeManager: ThemeManagerProtocol
    
    init() {
        appInitializer = AppInitializer()
        themeManager = appInitializer.readThemeManager()
        registerDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            AppInitializerView(themeManager: themeManager,
                               initialView: AnyView(WelcomeView())
                              )
        }
    }
}
