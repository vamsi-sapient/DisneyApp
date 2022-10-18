//
//  EnvironmentDTOModel.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import Core

public struct EnvironmentDTOModel: BaseDTO {
    public let environments: [EnvironmentDTOData]
}

public struct EnvironmentDTOData: Codable {
    public let name: String
    public let unauthURL: String
    public let authURL: String
    public let crmURL: String?
    public let authTokenHeader: String?
}
