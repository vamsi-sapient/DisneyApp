//
//  SwiftUIView.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 06/10/2022.
//

import SwiftUI
import DisneyUIKit
import Core
import AppInitializer

struct CharacterListView: View, BaseView {
    
    @ObservedObject var state: CharacterListViewState
    
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
        } else {
            List {
                ForEach(state.characters, id: \.id) { item in
                    NavigationLink(destination: nextScreen(item.url)) {
                        CharacterListRow(item: item,
                                         themeManager: themeManager,
                                        defaultImage: state.defaultImage)
                    }
                }
            }
            .navigationTitle(CharacterListViewConstants.Strings.screenTitle)
            .navigationBarTitleDisplayMode(.inline)
            .accessibilityIdentifier(CharacterListViewConstants.AccessibilityIdentifiers.view.rawValue)
            .onAppear {
                navigationBar(themeManager: themeManager)
            }
        }
    }
    
    private func nextScreen(_ url: String) -> AnyView {
        return NavigationManager.navigateTo(screenIdentifier: CharacterListViewConstants.detailScreenIdentifier,
                                            params: CharacterDetailNavigationParams(url: url))
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(viewModel: nil,
                          state: CharacterListView_Previews.createState(),
                          themeManager: ThemeManager())
    }
    
    static private func createState() -> CharacterListViewState {
        var uiData = [CharacterUIData]()
        
        for index in 1...10 {
            let data = CharacterUIData(id: index,
                                       name: "Name\(index)",
                                       imageUrl: nil,
                                       url: "",
                                       films: nil,
                                       tvShows: nil,
                                       videoGames: nil)
            uiData.append(data)
        }
        
        let state = CharacterListViewState(showProgress: true,
                                           characters: uiData)
        
        return state
    }
}
