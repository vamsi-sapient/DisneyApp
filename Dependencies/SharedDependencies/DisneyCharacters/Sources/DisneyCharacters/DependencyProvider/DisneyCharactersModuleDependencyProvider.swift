//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 07/10/2022.
//

import Foundation
import Core

public class DisneyCharactersModuleDependencyProvider: ModuleDependencyProviderProtocol {
    
    public init() {
        
    }
    
    public func provideViewModel(screenName: String) -> BaseViewModel? {
        let name = DisneyCharactersScreenConstants(rawValue: screenName)
        switch (name) {
        case .listView:
            return BaseViewModel(state: BaseStateObject())
        case .none:
            return nil
        }
    }
    
    public func provideStateObject(screenName: String) -> BaseStateObject? {
        let name = DisneyCharactersScreenConstants(rawValue: screenName)
        switch (name) {
        case .listView:
            return BaseStateObject()
        case .none:
            return nil
        }
    }
}
