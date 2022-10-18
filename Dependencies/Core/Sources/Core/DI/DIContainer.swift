//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 06/10/2022.
//

import Foundation

public final class DIContainer {
    private static let shared = DIContainer()
    private var crashlytics: CrashlyticsProtocol?
    private var dependencyProviders = [String: ModuleDependencyProviderProtocol]()
    
    private init() {
        // Make the constructor private so no instance can be created from outside
    }
    
    public func initializeTheContainer(crashlytics: CrashlyticsProtocol) {
        self.crashlytics = crashlytics
    }
    
    public class func registerModule(moduleName: String, provider: ModuleDependencyProviderProtocol) {
        DIContainer.shared.dependencyProviders[moduleName] = provider
    }
    
    public class func provideViewModelAndState(moduleName: String, screenName: String) -> (BaseViewModel?, BaseStateObject?) {
        guard let provider = DIContainer.shared.dependencyProviders[moduleName] else {
            DIContainer.shared.crashlytics?.recordTrace("Could not find the module 'ViewModel/State' provider")
            return (nil, nil)
        }
        
        let (viewModel, state) = provider.provideViewModelAndState(screenName: screenName)
        
        guard let viewModel = viewModel, let state = state else {
            DIContainer.shared.crashlytics?.recordTrace("Could not find get the 'ViewModel/State' for the screen")
            return (nil, nil)
        }
        return (viewModel, state)
    }
}
