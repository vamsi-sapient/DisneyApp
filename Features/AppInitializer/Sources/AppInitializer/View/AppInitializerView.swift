//
//  SwiftUIView.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 16/10/2022.
//

import SwiftUI
import Core
import DisneyUIKit

public struct AppInitializerView: View, BaseView {
    
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
        .accentColor(.black)
        .onAppear {
            navigationBar(themeManager: themeManager)
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
