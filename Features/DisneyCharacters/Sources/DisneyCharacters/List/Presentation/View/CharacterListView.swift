//
//  SwiftUIView.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 06/10/2022.
//

import SwiftUI
import DisneyUIKit
import Core

struct CharacterListView: View {
    
    @ObservedObject var state: CharacterListViewState
    @ObservedObject var result = CharacterListResult()
    
    private let viewModel: CharacterListViewModelProtocol?
    private let themeManager: ThemeManagerProtocol;
    
    public init(viewModel: CharacterListViewModelProtocol?,
                state: CharacterListViewState,
                themeManager: ThemeManagerProtocol) {
        self.state = state
        self.themeManager = themeManager
        self.viewModel = viewModel
        
        self.viewModel?.getCharactersList()
    }
    
    public var body: some View {
        if state.showProgress {
            ActivityIndicatorView(themeManager: themeManager)
        } else if state.selectedItemURL.isEmpty {
            List {
                ForEach(state.characters, id: \.id) { item in
                    CharacterListRow(item: item, themeManager: themeManager)
                        .onTapGesture {
                            viewModel?.selectCharacter(item)
                        }
                }
            }
            .navigationTitle(CharacterListViewConstants.Strings.screenTitle)
            .navigationBarTitleDisplayMode(.inline)
            .accessibilityIdentifier(CharacterListViewConstants.AccessibilityIdentifiers.view.rawValue)
        } else {
            NavigationManager.navigateTo(screenIdentifier: CharacterListViewConstants.detailScreenIdentifier,
                                         params: CharacterDetailNavigationParams(url: state.selectedItemURL))
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(viewModel: nil,
                          state: CharacterListViewState(),
                          themeManager: DefaultThemeManager())
    }
}
