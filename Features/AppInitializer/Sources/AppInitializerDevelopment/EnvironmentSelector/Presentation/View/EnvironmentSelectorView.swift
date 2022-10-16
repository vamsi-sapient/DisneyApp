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
    @ObservedObject var result = EnvironmentSelectorContainerViewResult()
    
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
        if result.selectedEnvironmentIndex >= 0 {
            nextScreen()
        } else {
            EnvironmentSelectorContainerView(environmentTitles: state.environmentTitles,
                                             themeManager: themeManager,
                                             result: result)
            .navigationTitle(EnvironmentSelectorViewConstants.Strings.screenTitle)
            .navigationBarTitleDisplayMode(.inline)
            .accessibilityIdentifier(EnvironmentSelectorViewConstants.AccessibilityIdentifiers.view.rawValue)
        }
    }
    
    private func nextScreen() -> AnyView {
        viewModel?.selectTheEnvironment(result.selectedEnvironmentIndex)
        return NavigationManager.navigateTo(screenIdentifier: initialViewIdentifier)
    }
}

struct EnvironmentSelectorContainerView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentSelectorView(initialViewIdentifier: "",
                                viewModel: nil,
                                state: EnvironmentSelectorViewState(environmentTitles: ["DEV", "QA"]),
                                themeManager: ThemeManager())
    }
}
