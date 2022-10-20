//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 19/10/2022.
//

import Foundation
import Core
import PromiseKit

public struct MockNetworkClient: DataProviderClientProtocol {
    
    public init(crashlytics: CrashlyticsProtocol?, authTokenManager: AuthManagerProtocol?) {
        
    }
    
    public func setEnvironmentData(_ data: EnvironmentData) {
        
    }
    
    public func executeRequest<T: Codable>(_ type: T.Type, request: DataRequest) -> Response<T> {
        return Promise { seal in
            var bundle = Bundle.main
            
            if request.name.isEmpty == false {
                let bundleIdentifier = String(request.name)
                guard let moduleBundle = Bundle(identifier: bundleIdentifier) else {
                    seal.reject(DisneyError(message: "Cannot find the bundle"))
                    return
                }
                bundle = moduleBundle
            }
            
            guard let url = bundle.url(forResource: request.path, withExtension: ".json") else {
                seal.reject(DisneyError(message: "Failed to decode local json response"))
                return
            }
            
            do {
                let data = try Data(contentsOf: url)
                let dataModel = try JSONDecoder().decode(type, from: data)
                seal.fulfill(dataModel)
                
            } catch {
                seal.reject(DisneyError(message: "Failed to decode local json response"))
            }
        }
    }
}
