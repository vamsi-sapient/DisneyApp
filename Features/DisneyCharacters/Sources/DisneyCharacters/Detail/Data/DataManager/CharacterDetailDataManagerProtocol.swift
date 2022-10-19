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

protocol CharacterDetailDataManagerProtocol {
    func getCharacterDetails(_ url: String, requestType: DataRequestType) -> Response<CharacterDetailDTOModel>
}

extension CharacterDetailDataManagerProtocol {
    func getCharacterDetails(_ url: String, requestType: DataRequestType = .REST) -> Response<CharacterDetailDTOModel> {
        return getCharacterDetails(url, requestType: requestType)
    }
}
