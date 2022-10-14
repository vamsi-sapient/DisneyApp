//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 11/10/2022.
//

import Foundation

public extension String {
    func localized(bundle: Bundle = .main) -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: bundle, value: "", comment: "")
    }
}
