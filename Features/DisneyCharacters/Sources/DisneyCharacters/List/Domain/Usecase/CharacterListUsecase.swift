//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI

class CharacterListUsecase: CharacterListUsecaseProtocol {
    private let repository: CharacterListRepositoryProtocol
    
    init(repository: CharacterListRepositoryProtocol) {
        self.repository = repository
    }
    func getCharactersList() -> Response<CharacterListDomainModel> {
        return repository.getCharactersList()
    }
}
