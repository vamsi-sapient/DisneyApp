//
//  FriendsListRow.swift
//  TestApp (iOS)
//
//  Created by Ranjit Singh
//

import SwiftUI
import DisneyUIKit

struct CharacterListRow: View {
    
    private let item: CharacterUIData
    private let themeManager: ThemeManagerProtocol
    
    init(item: CharacterUIData, themeManager: ThemeManagerProtocol) {
        self.item = item
        self.themeManager = themeManager
    }
    
    var body: some View {
        HStack {
            if let imageUrl = item.imageUrl, imageUrl.isEmpty == false {
                DisneyImageView(url: imageUrl)
                .frame(width: CharacterListViewConstants.Dimensions.width,
                       height: CharacterListViewConstants.Dimensions.height)
                .cornerRadius(CharacterListViewConstants.Dimensions.cornerRadius)
            } else {
                Image(systemName: CharacterListViewConstants.defaultImage)
            }
            
            Text(item.name.uppercased()).padding(CharacterListViewConstants.Dimensions.padding)
            
        }.frame(height: CharacterListViewConstants.Dimensions.rowHeight)
    }
}

