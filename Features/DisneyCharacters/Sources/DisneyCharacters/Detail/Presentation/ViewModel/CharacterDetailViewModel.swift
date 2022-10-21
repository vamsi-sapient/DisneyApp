//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI

final class CharacterDetailViewModel: BaseViewModel, CharacterDetailViewModelProtocol {
    private let state: CharacterDetailViewState
    private let usecase: CharacterDetailUsecaseProtocol
    
    required init(usecase: CharacterDetailUsecaseProtocol, state: CharacterDetailViewState) {
        self.state = state
        self.usecase = usecase
    }
    
    func getCharacterDetails(_ params: CharacterDetailNavigationParams) {
        state.showProgress = true
        usecase.getCharacterDetails(params.url).done { [weak self] item in
            guard let weakSelf = self else {
                return
            }
            weakSelf.state.showProgress = false
            if let imageURL = item.imageUrl {
                weakSelf.state.characterImageURL = imageURL
            }
            weakSelf.state.screenTitle = item.name
            
            weakSelf.state.characterDetails = weakSelf.updateUI(item)
        }.catch { error in
            
        }
    }
    
    func updateUI(_ item: CharacterDetailDomainModel) -> [CharacterDetailUIData] {
        var rows = [CharacterDetailUIData]()
        
        if let values = item.films, values.isEmpty == false {
            rows.append(CharacterDetailUIData(title: CharacterDetailViewConstants.Titles.films, value: nil, values: values))
        } else {
            rows.append(CharacterDetailUIData(title: CharacterDetailViewConstants.Titles.films, value: CharacterDetailViewConstants.Titles.noData))
        }
        
        if let values = item.shortFilms, values.isEmpty == false {
            rows.append(CharacterDetailUIData(title: CharacterDetailViewConstants.Titles.shortFilms, value: nil, values: values))
        } else {
            rows.append(CharacterDetailUIData(title: CharacterDetailViewConstants.Titles.shortFilms, value: CharacterDetailViewConstants.Titles.noData))
        }
        
        if let values = item.tvShows, values.isEmpty == false {
            rows.append(CharacterDetailUIData(title: CharacterDetailViewConstants.Titles.tvShows, value: nil, values: values))
        } else {
            rows.append(CharacterDetailUIData(title: CharacterDetailViewConstants.Titles.tvShows, value: CharacterDetailViewConstants.Titles.noData))
        }
        
        if let values = item.videoGames, values.isEmpty == false {
            rows.append(CharacterDetailUIData(title: CharacterDetailViewConstants.Titles.videoGames, value: nil, values: values))
        } else {
            rows.append(CharacterDetailUIData(title: CharacterDetailViewConstants.Titles.videoGames, value: CharacterDetailViewConstants.Titles.noData))
        }
        
        if let values = item.parkAttractions, values.isEmpty == false {
            rows.append(CharacterDetailUIData(title: CharacterDetailViewConstants.Titles.parkAttractions, value: nil, values: values))
        } else {
            rows.append(CharacterDetailUIData(title: CharacterDetailViewConstants.Titles.parkAttractions, value: CharacterDetailViewConstants.Titles.noData))
        }
        
        if let values = item.allies, values.isEmpty == false {
            rows.append(CharacterDetailUIData(title: CharacterDetailViewConstants.Titles.allies, value: nil, values: values))
        } else {
            rows.append(CharacterDetailUIData(title: CharacterDetailViewConstants.Titles.allies, value: CharacterDetailViewConstants.Titles.noData))
        }
        
        if let values = item.enemies, values.isEmpty == false {
            rows.append(CharacterDetailUIData(title: CharacterDetailViewConstants.Titles.enemies, value: nil, values: values))
        } else {
            rows.append(CharacterDetailUIData(title: CharacterDetailViewConstants.Titles.enemies, value: CharacterDetailViewConstants.Titles.noData))
        }
        
        return rows
    }
}
