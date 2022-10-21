//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 19/10/22.
//

import Foundation
import PromiseKit
import Core
import NetworkManager

@testable import DisneyCharacters

class MockDataManager: DataManagerProtocol {
    let mockNetworkClient = MockNetworkClient(crashlytics: nil, authTokenManager: nil)
   
    func storeTokens(authToken: String, refreshToken: String?) {
        
    }
    
    func setEnvironmentData(_ data: EnvironmentData) {
        mockNetworkClient.setEnvironmentData(data)
    }
    
    func request<T: Codable>(_ type: T.Type, request: DataRequest) -> Response<T> {
        return mockNetworkClient.executeRequest(type, request: request)
    }
}
