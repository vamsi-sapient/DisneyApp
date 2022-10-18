//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI
import NetworkManager

struct CharacterListDataManager: CharacterListDataManagerProtocol {
    
    private let dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func getCharactersList() -> Response<CharacterListDTOModel> {
        return dataManager.request(CharacterListDTOModel.self,
                                   request: DataRequest(type: .REST,
                                                        path: DisneyCharactersAPIConstants.characters.rawValue))
    }
}
