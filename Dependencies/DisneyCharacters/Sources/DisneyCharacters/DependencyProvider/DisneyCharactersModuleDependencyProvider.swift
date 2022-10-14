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
    
    public func provideViewModelAndState(screenName: String) -> (BaseViewModel?, BaseStateObject?, BaseStateObject?) {
        let name = DisneyCharactersScreenConstants(rawValue: screenName)
        
        let restClient
        
        switch (name) {
        case .listView:
            let networkservice
            let repository
            let usecase =
            
            let result = DisneyCharacterListResult()
            let state = DisneyCharacterListViewState()
            let viewModel = DisneyCharacterListViewModel(state: state, result: result)
            return (viewModel, state, result)
            
        case .detail:
            let networkservice
            let repository
            let usecase =
            
            let result = DisneyCharacterListResult()
            let state = DisneyCharacterListViewState()
            let viewModel = DisneyCharacterListViewModel(state: state, result: result)
            return (viewModel, state, result)
            
        case .none:
            return (nil, nil, nil)
        }
    }
}
