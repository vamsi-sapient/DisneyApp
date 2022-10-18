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

struct GlobalNavigationProvider: NavigationProviderProtocol {
    func screen(for screenIdentifier: String, params: NavigationParams?) -> AnyView? {
        let screenName = GlobalScreenConstants(rawValue: screenIdentifier)
        switch screenName {
        default:
            return AnyView(EmptyView())
        }
    }
}
