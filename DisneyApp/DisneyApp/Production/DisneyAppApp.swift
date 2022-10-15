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

@main
struct DisneyAppApp: App {
    
    fileprivate let appInitializer: AppInitializer
    
    init() {
        appInitializer = AppInitializer(themeManager: ThemeManager())
        registerDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            appInitializer.body(WelcomeView())
        }
    }
}
