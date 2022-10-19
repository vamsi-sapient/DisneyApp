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

public struct CharacterDetailDataManager: CharacterDetailDataManagerProtocol {
    
    private let dataManager: DataManagerProtocol
    
    public init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    public func getCharacterDetails(_ url: String, requestType: DataRequestType) -> Response<CharacterDetailDTOModel> {
        return dataManager.request(CharacterDetailDTOModel.self,
                                   request: DataRequest(type: requestType,
                                                        apiType: .CUSTOM,
                                                        path: url))
    }
}
