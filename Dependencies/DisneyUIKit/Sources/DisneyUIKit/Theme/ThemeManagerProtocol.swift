//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 12/10/2022.
//

import Foundation
import SwiftUI

public enum ViewType: String {
    case navigationBar
    case navigationBarTitle
    case button
    case imagePlaceHolder
    case activityIndicator
    case background
}

public enum ButtonType: String {
    case primary, secondary
}

public protocol ThemeManagerProtocol {
    func uiColorFor(viewType: String, viewSubType: String?) -> UIColor
    func colorFor(viewType: String, viewSubType: String?) -> Color
    func fontFor(viewType: String, viewSubType: String?) -> Font
    func uiFontFor(viewType: String, viewSubType: String?) -> UIFont
}

extension ThemeManagerProtocol {
    public func colorFor(viewType: String, viewSubType: String?) -> Color {
        return Color(uiColor: uiColorFor(viewType: viewType, viewSubType: viewSubType))
    }
    
    public func fontFor(viewType: String, viewSubType: String?) -> Font {
        return Font(uiFontFor(viewType: viewType, viewSubType: viewSubType))
    }
}
