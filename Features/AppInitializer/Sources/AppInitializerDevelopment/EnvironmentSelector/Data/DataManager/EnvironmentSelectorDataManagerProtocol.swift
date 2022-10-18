//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI
import NetworkManager
import AppInitializer

public protocol EnvironmentSelectorDataManagerProtocol {
    func getEnvironmentsList() -> Response<EnvironmentDTOModel>
    func selectTheEnvironment(_ data: EnvironmentData)
}
