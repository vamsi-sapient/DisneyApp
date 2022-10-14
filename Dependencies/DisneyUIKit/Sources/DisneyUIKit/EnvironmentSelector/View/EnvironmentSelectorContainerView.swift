//
//  SwiftUIView.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 11/10/2022.
//

import SwiftUI
import Core

public struct EnvironmentSelectorContainerView: View {
    @ObservedObject var state = EnvironmentSelectorContainerViewState()
    
    private var viewModel: EnvironmentSelectorContainerViewModel?
    private let themeManager: ThemeManagerProtocol;
    
    public init(environmentTitles: [String],
                themeManager: ThemeManagerProtocol,
                result: EnvironmentSelectorContainerViewResult) {
        self.themeManager = themeManager
        viewModel = EnvironmentSelectorContainerViewModel(environmentTitles: environmentTitles,
                                                          state: self.state,
                                                          result: result)
    }
    
    public var body: some View {
            List {
                Section {
                    ForEach(state.environmentTitles, id: \.id) { item in
                        EnvironmentSelectorRowView(title: item.title)
                    }
                } header: {
                    Text(EnvironmentSelectorContainerViewConstants.Strings.screenHeader)
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle(EnvironmentSelectorContainerViewConstants.Strings.screenTitle)
            .navigationBarTitleDisplayMode(.inline)
            .accessibilityIdentifier(EnvironmentSelectorContainerViewConstants.AccessibilityIdentifiers.view.rawValue)
        
    }
}

struct EnvironmentSelectorContainerView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentSelectorContainerView(environmentTitles: ["Dev", "QA"],
                                         themeManager: DefaultThemeManager(),
                                         result: EnvironmentSelectorContainerViewResult())
    }
}
