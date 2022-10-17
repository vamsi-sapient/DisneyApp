//
//  EnvironmentDTOModel.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation

public struct EnvironmentData {
    public let name: String
    public let unauthURL: String
    public let authURL: String
    public let crmURL: String?
    
    public init(name: String, unauthURL: String, authURL: String, crmURL: String?) {
        self.name = name
        self.unauthURL = unauthURL
        self.authURL = authURL
        self.crmURL = crmURL
    }
}
