//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 12/10/2022.
//

import Foundation
import SwiftUI
import Core
import DisneyUIKit

public struct ThemeManager: ThemeManagerProtocol {
    public init() {
        
    }
    
    public func uiColorFor(viewType: String, viewSubType: String?) -> UIColor {
        let type = ViewType(rawValue: viewType)
        var color: UIColor?
        switch type {
        case .navigationBar:
            color = UIColor(named: DisneyColors.blue)?.withAlphaComponent(0.7)
            
        case .navigationBarTitle:
            color = UIColor(named: DisneyColors.grey)
            
        case .button:
            if let viewSubType = viewSubType {
                color = colorForButton(ButtonType(rawValue: viewSubType) ?? ButtonType.primary)
            }
            
        case .imagePlaceHolder:
            color = UIColor(named: DisneyColors.grey)
            
        case .activityIndicator:
            color = UIColor(named: DisneyColors.green)
            
        case .background:
            color = UIColor(named: DisneyColors.grey)?.withAlphaComponent(0.2)
            
        default:
            return UIColor.clear
        }
        
        return color ?? UIColor.clear
    }
    
    public func uiFontFor(viewType: String, viewSubType: String?) -> UIFont {
        let defaultFont = UIFont.systemFont(ofSize: 24)
        let type = ViewType(rawValue: viewType)
        
        switch type {
        case .navigationBarTitle:
            return UIFont(name: "Roboto-Bold", size: 24) ?? defaultFont
            
        case .button:
            guard let viewSubType = viewSubType else {
                return defaultFont
            }
            return fontForButton(ButtonType(rawValue: viewSubType) ?? ButtonType.primary)
            
        default:
            return defaultFont
        }
    }
}

// MARK: Button
extension ThemeManager {
    fileprivate func colorForButton(_ viewSubType: ButtonType) -> UIColor {
        var color: UIColor?
        
        switch viewSubType {
        case .primary:
            color = UIColor(named: DisneyColors.green)?.withAlphaComponent(0.2)
            
        case .secondary:
            color = UIColor(named: DisneyColors.grey)
        }
        
        return color ?? UIColor.clear
    }
    
    fileprivate func fontForButton(_ viewSubType: ButtonType) -> UIFont {
        switch viewSubType {
        default:
            return UIFont.systemFont(ofSize: 14)
        }
    }
}
