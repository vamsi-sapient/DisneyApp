//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core

final class CharacterDetailViewState: BaseStateObject {
    @Published var screenTitle: String
    @Published var characterImageURL: String
    @Published var characterDetails: [CharacterDetailUIData]
    let defaultImage: String
    
    init(showProgress: Bool = false,
         screenTitle: String = "",
         characterImageURL: String = "",
         characterDetails: [CharacterDetailUIData] = [CharacterDetailUIData](),
         defaultImage: String = CharacterListViewConstants.defaultImage) {
        self.screenTitle = screenTitle
        self.characterImageURL = characterImageURL
        self.characterDetails = characterDetails
        self.defaultImage = defaultImage
        
        super.init(showProgress: showProgress)
    }
}

struct CharacterDetailUIData {
    let id = UUID()
    let title: String?
    let value: String?
    let values: [String]?
    
    init(title: String? = nil, value: String?, values: [String]? = nil) {
        self.title = title
        self.value = value
        self.values = values
    }
}
