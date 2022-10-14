//
//  EnvironmentDomainModel.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import Core

struct EnvironmentDomainModel: BaseDomainModel {
    let environments: [EnvironmentDomainData]
}

struct EnvironmentDomainData: Codable {
    let name: String
    let unauthURL: String?
    let authURL: String
    let crmURL: String?
}

