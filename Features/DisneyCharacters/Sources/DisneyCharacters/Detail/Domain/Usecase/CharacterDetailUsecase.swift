//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI

struct CharacterDetailUsecase: CharacterDetailUsecaseProtocol {
    private let repository: CharacterDetailRepositoryProtocol
    
    init(repository: CharacterDetailRepositoryProtocol) {
        self.repository = repository
    }
    func getCharacterDetails(_ url: String) -> Response<CharacterDetailDomainModel> {
        return repository.getCharacterDetails(url)
    }
}
