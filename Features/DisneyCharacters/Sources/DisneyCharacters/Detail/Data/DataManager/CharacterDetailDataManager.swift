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

struct CharacterDetailDataManager: CharacterDetailDataManagerProtocol {
    
    private let dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func getCharacterDetails(_ url: String) -> Response<CharacterDetailDTOModel> {
        return dataManager.request(CharacterDetailDTOModel.self,
                                   request: DataRequest(type: .REST,
                                                        apiType: .CUSTOM,
                                                        path: url))
    }
}
