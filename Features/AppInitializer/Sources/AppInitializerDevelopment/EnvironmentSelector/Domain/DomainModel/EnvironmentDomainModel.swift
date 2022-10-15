//
//  EnvironmentDomainModel.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import Core

public struct EnvironmentDomainModel: BaseDomainModel {
    let environments: [EnvironmentDomainData]
}

public struct EnvironmentDomainData: Codable {
    let name: String
    let unauthURL: String?
    let authURL: String
    let crmURL: String?
}

