//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import SwiftUI
import Core
import SharedDependencies

public struct AppInitializerNavigationProvider: NavigationProviderProtocol {
    
    public init() {
        
    }
    
    public func screen(for screenIdentifier: String, params: NavigationParams?) -> AnyView? {
        let screenName = AppInitializerScreenConstants(rawValue: screenIdentifier)
        
        var view: any View
        
        switch screenName {
        case .welcome:
            view = WelcomeView()
            
        default:
            return nil
        }
        
        return AnyView(view)
    }
}
