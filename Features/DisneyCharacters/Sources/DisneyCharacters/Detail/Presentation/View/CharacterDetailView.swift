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
            containerView()
                .navigationTitle(Text(state.screenTitle))
                .navigationBarTitleDisplayMode(.inline)
                .accessibilityIdentifier(CharacterDetailViewConstants.AccessibilityIdentifiers.view.rawValue)
        }
    }
    
    private func containerView() -> some View {
        return Text("vamsu")
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(viewModel: nil,
                            state: CharacterDetailViewState(),
                            themeManager: DefaultThemeManager(),
                            params: CharacterDetailNavigationParams(url: ""))
    }
}
