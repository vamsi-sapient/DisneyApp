//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 07/10/2022.
//

import Foundation
import Core
import SharedDependencies

public final class DisneyCharactersModuleDependencyProvider: ModuleDependencyProviderProtocol {
    
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
            let (viewModel, state) = provideViewModelAndStateForDisneyCharactersModule(screenName: screenName)
            return (viewModel, state)
        }
    }
    
    private func provideViewModelAndStateForDisneyCharactersModule(screenName: String) -> (BaseViewModel?, BaseStateObject?) {
        let name = DisneyCharactersScreenConstants(rawValue: screenName)
        
        switch name {
        case .detail:
            let dataProvider = CharacterDetailDataManager(dataManager: dataManager)
            let repository = CharacterDetailRepository(dataManager: dataProvider,
                                                       mapper: CharacterDetailDTOToDomainModelMapper())
            let usecase = CharacterDetailUsecase(repository: repository)
            let state = CharacterDetailViewState()
            
            let viewModel = CharacterDetailViewModel(usecase: usecase, state: state)
            
            return (viewModel, state)
            
            
        default:
            return (nil, nil)
        }
    }
}
