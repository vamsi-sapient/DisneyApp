//
//  SwiftUIView.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 06/10/2022.
//

import SwiftUI
import DisneyUIKit

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
    }
    
    public var body: some View {
        Text("Hello, World, vamsi got it successfully!")
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        let result = CharacterListResult()
        let state = CharacterListViewState()
        
        CharacterListView(viewModel: nil,
                          state: state,
                          themeManager: DefaultThemeManager())
    }
}
