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

class EnvironmentSelectorDataStore: EnvironmentSelectorDataStoreProtocol {
    
    private let dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func getEnvironmentsList() -> Response<EnvironmentDTOModel> {
        return dataManager.request(EnvironmentDTOModel.self,
                                   request: DataRequest(type: .PLIST,
                                                        path: "Environments"))
    }
}
