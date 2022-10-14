//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 12/10/2022.
//

import Foundation
import SwiftUI

public protocol ThemeManagerProtocol {
    func colorFor(viewType: String, viewSubType: String?) -> UIColor
    func fontFor(viewType: String, viewSubType: String?) -> Font
    func uiFontFor(viewType: String, viewSubType: String?) -> UIFont
}
