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
}

public enum ButtonType: String {
    case primary, secondary
}

public protocol ThemeManagerProtocol {
    func colorFor(viewType: String, viewSubType: String?) -> UIColor
    func fontFor(viewType: String, viewSubType: String?) -> Font
    func uiFontFor(viewType: String, viewSubType: String?) -> UIFont
}
