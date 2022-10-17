//
//  SwiftUIView.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 17/10/2022.
//

import SwiftUI

public struct ActivityIndicatorView: View {
    let themeManager: ThemeManagerProtocol
    
    public init(themeManager: ThemeManagerProtocol) {
        self.themeManager = themeManager
    }
    
    public var body: some View {
        let color = themeManager.colorFor(viewType: ViewType.activityIndicator.rawValue,
                                            viewSubType: nil)
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: color))
    }
}

struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView(themeManager: DefaultThemeManager())
    }
}
