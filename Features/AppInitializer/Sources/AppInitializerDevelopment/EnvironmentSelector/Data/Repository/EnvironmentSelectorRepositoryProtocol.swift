//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI

public protocol EnvironmentSelectorRepositoryProtocol {
    func getEnvironmentsList() -> Response<EnvironmentDomainModel>
    func selectTheEnvironment(_ data: EnvironmentDomainData)
}
