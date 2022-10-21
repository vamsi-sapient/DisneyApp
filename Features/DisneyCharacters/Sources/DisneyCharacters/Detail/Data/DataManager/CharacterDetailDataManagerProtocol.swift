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
    func getCharacterDetails(_ url: String) -> Response<CharacterDetailDTOModel>
}
