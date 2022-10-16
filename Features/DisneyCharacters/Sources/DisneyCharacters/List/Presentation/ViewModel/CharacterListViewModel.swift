//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI

class CharacterListViewModel: BaseViewModel, CharacterListViewModelProtocol {
    private let state: CharacterListViewState
    private let usecase: CharacterListUsecaseProtocol
    
    required init(usecase: CharacterListUsecaseProtocol, state: CharacterListViewState) {
        self.state = state
        self.usecase = usecase
    }
    
    func getCharactersList() {
        usecase.getCharactersList().done { [weak self] data in
            self?.state.characters = data.characters
        }.catch { error in
            
        }
    }
}
