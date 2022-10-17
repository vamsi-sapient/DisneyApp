//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import SwiftUI

public final class NavigationManager: NavigationManagerProtocol {
    
    private static let shared = NavigationManager()
    private var crashlytics: CrashlyticsProtocol?
    var navigationLinkProviders = [String: NavigationProviderProtocol]()
    
    private init() {
    }
    
    public static func initializeNavigationManager(crashlytics: CrashlyticsProtocol) {
        NavigationManager.shared.crashlytics = crashlytics
    }
    
    public static func registerNavigationLinkProvider(featureName: String, provider: NavigationProviderProtocol) {
        NavigationManager.shared.navigationLinkProviders[featureName] = provider
    }
    
    public static func navigateTo(screenIdentifier: String, params: NavigationParams? = nil) -> AnyView {
        return NavigationManager.shared.screen(with: screenIdentifier, params: params)
    }
    
    private func screen(with identifier: String, params: NavigationParams?) -> AnyView {
        let body = AnyView(EmptyView())
        
        let stringArray = identifier.split(separator: "_")
        if stringArray.count <= 1 {
            crashlytics?.recordError("Feature configuration Issue")
            return body
        }
        guard let moduleName = stringArray.first,
              let screenName = stringArray.last else {
            crashlytics?.recordError("The screen identifier should follow the format 'ModuleName.ScreenName'")
            return body
        }
        
        let module = String(moduleName)
        let screen = String(screenName)
        
        guard let provider = navigationLinkProviders[module] else {
            crashlytics?.recordError("Cannot find the Navigation Link provider")
            return body
        }
        
        guard let view = provider.screen(for: screen, params: params) else {
            crashlytics?.recordError("Cannot find the Screen")
            return body
        }
        
        return view
    }
}
