//
//  EnvironmentDTOModel.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import Core

public struct EnvironmentDTOModel: BaseDTO {
    let environments: [EnvironmentData]
}

public struct EnvironmentData: Codable {
    let name: String
    let unauthURL: String?
    let authURL: String
    let crmURL: String?
}
