//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI

protocol CharacterListViewModelProtocol: BaseViewModel {
    func getCharactersList()
    func selectCharacter(_ item: CharacterUIData)
}
