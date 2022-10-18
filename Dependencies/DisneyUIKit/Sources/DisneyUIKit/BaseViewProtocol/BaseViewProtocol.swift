//
//  SwiftUIView.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 18/10/2022.
//

import SwiftUI

public protocol BaseView {
    func navigationBar(themeManager: ThemeManagerProtocol)
}

extension BaseView {
    public func navigationBar(themeManager: ThemeManagerProtocol) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        appearance.backgroundColor = themeManager.uiColorFor(viewType: ViewType.navigationBar.rawValue,
                                                             viewSubType: nil)
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: themeManager.uiColorFor(viewType: ViewType.navigationBarTitle.rawValue, viewSubType: nil),
                                          NSAttributedString.Key.font: themeManager.uiFontFor(viewType: ViewType.navigationBarTitle.rawValue, viewSubType: nil)
        ]
        
        let backButtonAppearance = UIBarButtonItemAppearance(style: .plain)
        backButtonAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: themeManager.uiColorFor(viewType: ViewType.navigationBarTitle.rawValue, viewSubType: nil)]
        appearance.backButtonAppearance = backButtonAppearance
        
        // Inline appearance (standard height appearance)
        UINavigationBar.appearance().standardAppearance = appearance
        // Large Title appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
