//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import SwiftUI

public struct DefaultThemeManager: ThemeManagerProtocol {
    
    public init() {
        
    }
    
    public func uiColorFor(viewType: String, viewSubType: String?) -> UIColor {
        return UIColor.black
    }
    
    public func uiFontFor(viewType: String, viewSubType: String?) -> UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
}
