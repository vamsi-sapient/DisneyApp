//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import SwiftUI
import Core
import SharedDependencies
import DisneyUIKit

public class DisneyCharacterNavigationProvider: NavigationProviderProtocol {
    
    fileprivate let themeManager: ThemeManagerProtocol
    fileprivate let dependencyProvider: ModuleDependencyProviderProtocol
    
    public init(themeManager: ThemeManagerProtocol,
                dependencyProvider: ModuleDependencyProviderProtocol) {
        self.themeManager = themeManager
        self.dependencyProvider = dependencyProvider
    }
    
    public func screen(for screenIdentifier: String) -> AnyView? {
        let (viewModel, state) = DIContainer.provideViewModelAndState(moduleName: ModuleNames.disneyCharacters.rawValue,
                                                                              screenName: screenIdentifier)
        
        var view: any View
        
        switch screenIdentifier {
        case SharedScreenNames.characterListView.rawValue:
            view = CharacterListView(viewModel: viewModel as! CharacterListViewModel,
                                     state: state as! CharacterListViewState,
                                     themeManager: themeManager)
        default:
            let screenName = DisneyCharactersScreenConstants(rawValue: screenIdentifier)
            
            switch screenName {
            default:
                return nil
            }
        }
        return AnyView(view)
    }
}
