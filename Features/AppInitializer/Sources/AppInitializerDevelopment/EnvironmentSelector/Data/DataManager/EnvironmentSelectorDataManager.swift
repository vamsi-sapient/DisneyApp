//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI
import PromiseKit
import AppInitializer

public final class EnvironmentSelectorDataManager: EnvironmentSelectorDataManagerProtocol {
    
    private let dataManager: DataManagerProtocol
    
    public init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    public func getEnvironmentsList() -> Response<EnvironmentDTOModel> {
        return dataManager.request(EnvironmentDTOModel.self,
                                   request: DataRequest(type: .PLIST,
                                                        path: "Environments"))
    }
    
    public func selectTheEnvironment(_ data: EnvironmentData) {
        dataManager.setEnvironmentData(data)
    }
}
