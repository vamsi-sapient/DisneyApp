//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core

final class CharacterDetailViewState: BaseStateObject {
    @Published var screenTitle: String = ""
    @Published var characterImageURL: String = ""
    @Published var characterDetails = [CharacterDetailUIData]()
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
