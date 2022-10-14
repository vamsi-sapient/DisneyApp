//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import SwiftUI

class DefaultThemeManager: ThemeManagerProtocol {
    
    func colorFor(viewType: String, viewSubType: String?) -> UIColor {
        return UIColor.black
    }
    
    func fontFor(viewType: String, viewSubType: String?) -> Font {
        return Font.body
    }
    
    func uiFontFor(viewType: String, viewSubType: String?) -> UIFont {
        return UIFont.systemFont(ofSize: 12)
    }
}
