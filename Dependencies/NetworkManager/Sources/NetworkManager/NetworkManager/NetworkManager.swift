//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 11/10/2022.
//

import Foundation
import Core
import PromiseKit

class NetworkManager {
    
    private var crashlytics: CrashlyticsProtocol?
    
    private var restClient: DataProviderClientProtocol?
    private var graphqlClient: DataProviderClientProtocol?
    private var mockNetworkClient: DataProviderClientProtocol?
    
    init(crashlytics: CrashlyticsProtocol,
         restClient: DataProviderClientProtocol?,
         graphqlClient: DataProviderClientProtocol?,
         mockNetworkClient: DataProviderClientProtocol?) {
        self.crashlytics = crashlytics
        self.restClient = restClient
        self.graphqlClient = graphqlClient
        self.mockNetworkClient = mockNetworkClient
    }
    
    func executeAPIRequest<T: Codable>(_ type: T.Type, request: DataRequest) -> Response<T> {
        switch request.type {
        case .REST:
            guard let client = restClient else {
                return Promise { seal in
                    seal.reject(DisneyError(message: "APIHandler instance is not created"))
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
