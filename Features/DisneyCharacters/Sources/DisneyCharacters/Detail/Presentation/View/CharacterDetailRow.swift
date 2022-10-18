//
//  FriendsListRow.swift
//  TestApp (iOS)
//
//  Created by Ranjit Singh
//

import SwiftUI
import DisneyUIKit

struct CharacterDetailRow: View {
    
    private let item: CharacterDetailUIData
    private let themeManager: ThemeManagerProtocol
    
    init(item: CharacterDetailUIData, themeManager: ThemeManagerProtocol) {
        self.item = item
        self.themeManager = themeManager
    }
    
    var body: some View {    
        HStack {
            if let title = item.title {
                Text(title)
            }
            
            if let value = item.value {
                Text(value)
            } else if let values = item.values {
                let joined = values.joined(separator: ",")
                Text(joined)
            }
        }
    }
}

