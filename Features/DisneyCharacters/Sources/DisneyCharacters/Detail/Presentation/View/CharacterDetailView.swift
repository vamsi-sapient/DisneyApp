//
//  SwiftUIView.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 06/10/2022.
//

import SwiftUI
import DisneyUIKit

struct CharacterDetailView: View {
    
    @ObservedObject var state: CharacterDetailViewState
    
    private let viewModel: CharacterDetailViewModelProtocol?
    private let themeManager: ThemeManagerProtocol;
    
    public init(viewModel: CharacterDetailViewModelProtocol?,
                state: CharacterDetailViewState,
                themeManager: ThemeManagerProtocol,
                params: CharacterDetailNavigationParams) {
        self.state = state
        self.themeManager = themeManager
        self.viewModel = viewModel
        
        self.viewModel?.getCharacterDetails(params)
    }
    
    public var body: some View {
        if state.showProgress {
            ActivityIndicatorView(themeManager: themeManager)
        } else {
            let bgColor = themeManager.colorFor(viewType: ViewType.background.rawValue,
                                                viewSubType: nil)
            VStack {
                VStack {
                    if let imageUrl = state.characterImageURL, imageUrl.isEmpty == false {
                        DisneyImageView(url: imageUrl)
                            .frame(width: CharacterDetailViewConstants.Dimensions.width,
                                   height: CharacterDetailViewConstants.Dimensions.height)
                            .cornerRadius(CharacterDetailViewConstants.Dimensions.cornerRadius)
                    } else {
                        Image(systemName: CharacterListViewConstants.defaultImage)
                    }
                }
                .background(bgColor)
                .padding(.top, CharacterDetailViewConstants.Dimensions.padding)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: CharacterDetailViewConstants.Dimensions.height)
                
                if #available(iOS 16, *) {
                    List {
                        ForEach(state.characterDetails, id: \.id) { item in
                            CharacterDetailRow(item: item, themeManager: themeManager)
                        }
                        .listRowBackground(Color.white)
                    }
                    .scrollContentBackground(.hidden) // Xcode 14b4+
                    .background(bgColor)
                } else {
                    // Fallback on earlier versions
                }
            }
            .background(bgColor)
            .navigationTitle(Text(state.screenTitle))
            .navigationBarTitleDisplayMode(.inline)
            .accessibilityIdentifier(CharacterDetailViewConstants.AccessibilityIdentifiers.view.rawValue)
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(viewModel: nil,
                            state: state(),
                            themeManager: DefaultThemeManager(),
                            params: CharacterDetailNavigationParams(url: ""))
    }
    
    static func state() -> CharacterDetailViewState {
        let state = CharacterDetailViewState()
        state.characterDetails = [CharacterDetailUIData(title: "Title", value: "Value"),
                                  CharacterDetailUIData(title: "Title1", value: "Value1"),
                                  CharacterDetailUIData(title: "Title2", value: "Value2")]
        return state
    }
}
