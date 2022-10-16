//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 11/10/2022.
//

import Foundation
import Core

struct EnvironmentSelectorViewConstants {
    enum AccessibilityIdentifiers: String {
        case view = "EnvironmentSelectorView"
    }
    
    struct Strings {
        static let screenTitle = "environment_selector_screen_title".localized(bundle: Bundle.module)
        static let screenHeader = "select_environment".localized(bundle: Bundle.module)
    }
}
