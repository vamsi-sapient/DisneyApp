//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import SwiftUI
import Core
import SharedDependencies
import AppInitializer

class GlobalNavigationProvider: NavigationProviderProtocol {
    
    func screen(for screenIdentifier: String) -> AnyView? {
        let screenName = GlobalScreenConstants(rawValue: screenIdentifier)
        
        switch screenName {
        default:
            return AnyView(EmptyView())
        }
    }
}
