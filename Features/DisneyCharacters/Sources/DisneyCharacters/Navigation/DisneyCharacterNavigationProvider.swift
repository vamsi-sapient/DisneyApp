//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import SwiftUI
import Core
import SharedDependencies

public class DisneyCharacterNavigationProvider: NavigationProviderProtocol {
    
    public init() {
        
    }
    
    public func screen(for screenIdentifier: String) -> AnyView? {
        let (viewModel, state, result) = DIContainer.provideViewModelAndState(moduleName: ModuleNames.disneyCharacters.rawValue,
                                                                              screenName: screenIdentifier)
        
        let screenName = DisneyCharactersScreenConstants(rawValue: screenIdentifier)
        
        var view: any View
        
        switch screenName {
        case .listView:
            view = DisneyCharacterListView(viewModel: viewModel as! DisneyCharacterListViewModelProtocol,
                                           state: state as! DisneyCharacterListViewState,
                                           result: result as! DisneyCharacterListResult)
            
        default:
            return nil
        }
        
        return AnyView(view)
    }
}
