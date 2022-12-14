//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 11/10/2022.
//

import Foundation
import Core
import PromiseKit

public final class NetworkManager: NetworkManagerProtocol {
    
    private let crashlytics: CrashlyticsProtocol?
    
    private let restClient: DataProviderClientProtocol?
    private let graphqlClient: DataProviderClientProtocol?
    private let mockNetworkClient: DataProviderClientProtocol?
    
    required public init(crashlytics: CrashlyticsProtocol?,
                         restClient: DataProviderClientProtocol?,
                         graphqlClient: DataProviderClientProtocol?,
                         mockNetworkClient: DataProviderClientProtocol?) {
        self.crashlytics = crashlytics
        self.restClient = restClient
        self.graphqlClient = graphqlClient
        self.mockNetworkClient = mockNetworkClient
    }
    
    public func setEnvironmentData(_ data: EnvironmentData) {
        restClient?.setEnvironmentData(data)
        graphqlClient?.setEnvironmentData(data)
        mockNetworkClient?.setEnvironmentData(data)
    }
    
    public func executeAPIRequest<T: Codable>(_ type: T.Type, request: DataRequest) -> Response<T> {
        switch request.type {
        case .REST:
            guard let client = restClient else {
                return Promise { seal in
                    seal.reject(DisneyError(message: "APIHandler instance is not created"))
                }
            }
            return client.executeRequest(type, request: request)
            
        case .MOCK:
            guard let client = mockNetworkClient else {
                return Promise { seal in
                    seal.reject(DisneyError(message: "Mock Network Handler instance is not created"))
                }
            }
            return client.executeRequest(type, request: request)
            
        default:
            return Promise { seal in
                seal.reject(DisneyError(message: "Unknown request type"))
            }
        }
    }
}
