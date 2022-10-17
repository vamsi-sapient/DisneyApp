//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 11/10/2022.
//

import Foundation
import Core
import SharedDependencies

struct CharacterListViewConstants {
    enum AccessibilityIdentifiers: String {
        case view = "CharacterListView"
    }
    
    struct Strings {
        static let screenTitle = "character_list_screen_title".localized(bundle: Bundle.module)
    }
    
    struct Dimensions {
        static let width = 70.0
        static let height = 70.0
        static let cornerRadius = 20.0
        static let padding = 10.0
        static let rowHeight = 80.0
    }
    
    static let defaultImage = "person"
    static let detailScreenIdentifier = "\(ModuleNames.disneyCharacters.rawValue)_\(DisneyCharactersScreenConstants.detail.rawValue)"
}
