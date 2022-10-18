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
        let dataManager = appInitializer.readDataManager()
        registerDependencies(themeManager: themeManager,
                             dataManager: dataManager)
        
        appInitialzation(dataManager: dataManager, crashlytics: appInitializer.readCrashlytics())
    }
    
    var body: some Scene {
        WindowGroup {
            AppInitializerView(themeManager: themeManager,
                               initialView: AnyView(WelcomeView())
            )
        }
    }
    
    private mutating func appInitialzation(dataManager: DataManagerProtocol, crashlytics: CrashlyticsProtocol) {
        let plistReader = appInitializer.readPListReader()
        let data = plistReader.executeRequest(EnvironmentDTOModel.self, request: DataRequest(type: .PLIST, path: "Environments"))
        guard let data = data else {
            // Exit from the app
            return
        }
        
        let filteredEnvironment = data.environments.filter {
            $0.name.caseInsensitiveCompare("prod") == .orderedSame
        }
        
        guard let environment = filteredEnvironment.first else {
            crashlytics.recordError("Cannot find any filtered environment")
            // Exit from the app
            return
        }
        
        dataManager.setEnvironmentData(EnvironmentData(name: environment.name,
                                                                   unauthURL: environment.unauthURL,
                                                                   authURL: environment.authURL,
                                                                   crmURL: environment.crmURL,
                                                                   authTokenHeader: environment.authTokenHeader))
    }
}
