//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 10/10/2022.
//

import Foundation
import SwiftUI

public protocol NavigationManagerProtocol {
    static func initializeNavigationManager(crashlytics: CrashlyticsProtocol)
    static func registerNavigationLinkProvider(featureName: String, provider: NavigationProviderProtocol)
    static func navigateTo(screenIdentifier: String, params: NavigationParams?) -> AnyView
}
