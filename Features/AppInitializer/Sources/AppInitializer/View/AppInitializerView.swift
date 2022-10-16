//
//  SwiftUIView.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 16/10/2022.
//

import SwiftUI
import Core
import DisneyUIKit

public struct AppInitializerView: View {
    
    private let themeManager: ThemeManagerProtocol
    private let initialView: AnyView
    
    public init(themeManager: ThemeManagerProtocol,
                initialView: AnyView) {
        self.themeManager = themeManager
        self.initialView = initialView
    }
    
    public var body: some View {
        return NavigationView {
            initialView
        }
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = themeManager.colorFor(viewType: ViewType.navigationBar.rawValue,
                                                                      viewSubType: nil)
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: themeManager.colorFor(viewType: ViewType.navigationBarTitle.rawValue, viewSubType: nil),
                                              NSAttributedString.Key.font: themeManager.uiFontFor(viewType: ViewType.navigationBarTitle.rawValue, viewSubType: nil)
                                             ]

            // Inline appearance (standard height appearance)
            UINavigationBar.appearance().standardAppearance = appearance
            // Large Title appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

struct AppInitializerView_Previews: PreviewProvider {
    static var previews: some View {
        AppInitializerView(themeManager: ThemeManager(),
                           initialView: AnyView(EmptyView())
                          )
    }
}
