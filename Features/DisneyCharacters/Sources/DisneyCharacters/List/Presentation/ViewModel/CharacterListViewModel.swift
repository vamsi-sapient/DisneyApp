//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI

final class CharacterListViewModel: BaseViewModel, CharacterListViewModelProtocol {
    private let state: CharacterListViewState
    private let usecase: CharacterListUsecaseProtocol
    
    required init(usecase: CharacterListUsecaseProtocol, state: CharacterListViewState) {
        self.state = state
        self.usecase = usecase
    }
    
    func getCharactersList() {
        state.showProgress = true
        usecase.getCharactersList().done { [weak self] data in
            self?.state.showProgress = false
            
            var characters = [CharacterUIData]()
            
            data.characters.forEach { item in
                characters.append(CharacterUIData(id: item.id,
                                                  name: item.name,
                                                  imageUrl: item.imageUrl,
                                                  url: item.url,
                                                  films: item.films,
                                                  tvShows: item.tvShows,
                                                  videoGames: item.videoGames)
                                 )
            }
            
            self?.state.characters = characters
        }.catch { error in
            
        }
    }
}
