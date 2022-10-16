//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 07/10/2022.
//

import Foundation
import Core
import SharedDependencies

public class DisneyCharactersModuleDependencyProvider: ModuleDependencyProviderProtocol {
    
    fileprivate let dataManager: DataManagerProtocol
    
    public init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    public func provideViewModelAndState(screenName: String) -> (BaseViewModel?, BaseStateObject?) {
        
        switch screenName {
        case SharedScreenNames.characterListView.rawValue:
            let dataProvider = CharacterListDataManager(dataManager: dataManager)
            let repository = CharacterListRepository(dataManager: dataProvider,
                                                     mapper: CharacterListDTOToDomainModelMapper())
            let usecase = CharacterListUsecase(repository: repository)
            let state = CharacterListViewState()
            
            let viewModel = CharacterListViewModel(usecase: usecase, state: state)
            
            return (viewModel, state)
            
        default:
            let name = DisneyCharactersScreenConstants(rawValue: screenName)
            
            switch (name) {
            default:
                return (nil, nil)
            }
        }
    }
}
