//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI

class CharacterDetailViewModel: BaseViewModel, CharacterDetailViewModelProtocol {
    private let state: CharacterDetailViewState
    private let usecase: CharacterDetailUsecaseProtocol
    
    required init(usecase: CharacterDetailUsecaseProtocol, state: CharacterDetailViewState) {
        self.state = state
        self.usecase = usecase
    }
    
    func getCharacterDetails(_ params: CharacterDetailNavigationParams) {
        state.showProgress = true
        usecase.getCharacterDetails(params.url).done { [weak self] item in
            self?.state.showProgress = false
            self?.state.screenTitle = item.name
            self?.state.characterDetails = CharacterDetailUIData(id: item.id,
                                                                 name: item.name,
                                                                 imageUrl: item.imageUrl,
                                                                 url: item.url,
                                                                 films: item.films,
                                                                 shortFilms: item.shortFilms,
                                                                 tvShows: item.tvShows,
                                                                 videoGames: item.videoGames,
                                                                 parkAttractions: item.parkAttractions,
                                                                 allies: item.allies,
                                                                 enemies: item.enemies)
        }.catch { error in
            
        }
    }
}
