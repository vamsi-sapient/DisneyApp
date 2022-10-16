//
//  EnvironmentDTOModel.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import Core

public struct EnvironmentData {
    let name: String
    let unauthURL: String?
    let authURL: String
    let crmURL: String?
    
    public init(name: String, unauthURL: String?, authURL: String, crmURL: String?) {
        self.name = name
        self.unauthURL = unauthURL
        self.authURL = authURL
        self.crmURL = crmURL
    }
}
