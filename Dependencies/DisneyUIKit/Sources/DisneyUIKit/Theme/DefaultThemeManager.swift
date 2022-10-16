//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import SwiftUI

public class DefaultThemeManager: ThemeManagerProtocol {
    
    public init() {
        
    }
    
    public func colorFor(viewType: String, viewSubType: String?) -> UIColor {
        return UIColor.black
    }
    
    public func fontFor(viewType: String, viewSubType: String?) -> Font {
        return Font.body
    }
    
    public func uiFontFor(viewType: String, viewSubType: String?) -> UIFont {
        return UIFont.systemFont(ofSize: 12)
    }
}
