//
//  SwiftUIView.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 11/10/2022.
//

import SwiftUI
import Core
import DisneyUIKit
import AppInitializer

public struct EnvironmentSelectorView: View {
    @ObservedObject var state: EnvironmentSelectorViewState
    
    private let initialViewIdentifier: String
    private let viewModel: EnvironmentSelectorViewModelProtocol?
    private let themeManager: ThemeManagerProtocol;
    
    public init(initialViewIdentifier: String,
                viewModel: EnvironmentSelectorViewModelProtocol?,
                state: EnvironmentSelectorViewState,
                themeManager: ThemeManagerProtocol) {
        self.themeManager = themeManager
        self.viewModel = viewModel
        self.state = state
        self.initialViewIdentifier = initialViewIdentifier
        
        self.viewModel?.getEnvironmentsList()
    }
    
    public var body: some View {
        List {
            Section {
                ForEach(state.environmentTitles, id: \.id) { item in
                    NavigationLink(destination: NavigationManager.navigateTo(screenIdentifier: initialViewIdentifier)) {
                        EnvironmentSelectorRowView(title: item.title).onTapGesture {
                            nextScreen(item.title)
                        }
                    }
                }
            } header: {
                Text(EnvironmentSelectorViewConstants.Strings.screenHeader)
            }
            .listStyle(.insetGrouped)
        }
        .navigationTitle(EnvironmentSelectorViewConstants.Strings.screenTitle)
        .navigationBarTitleDisplayMode(.inline)
        .accessibilityIdentifier(EnvironmentSelectorViewConstants.AccessibilityIdentifiers.view.rawValue)
    }
    
    private func nextScreen(_ title: String) {
        viewModel?.selectTheEnvironment(title)
    }
}

struct EnvironmentSelectorContainerView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentSelectorView(initialViewIdentifier: "",
                                viewModel: nil,
                                state: EnvironmentSelectorViewState(environmentTitles: [EnvironmentUIModel(title: "DEV"), EnvironmentUIModel(title:"QA")]),
                                themeManager: ThemeManager())
    }
}
