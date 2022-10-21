//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 19/10/2022.
//

import Foundation
import Core
import PromiseKit

public final class MockNetworkClient: DataProviderClientProtocol {
    private var data: EnvironmentData?
    
    public init(crashlytics: CrashlyticsProtocol?, authTokenManager: AuthManagerProtocol?) {
        
    }
    
    public func setEnvironmentData(_ data: EnvironmentData) {
        self.data = data
    }
    
    public func executeRequest<T: Codable>(_ type: T.Type, request: DataRequest) -> Response<T> {
        return Promise { seal in
            var bundle = Bundle.main
            var path = data?.name ?? ""
            
            if path.isEmpty {
                path = request.path
            }
            
            if request.name.isEmpty == false {
                let bundleIdentifier = String(request.name)
                guard let moduleBundle = Bundle(identifier: bundleIdentifier) else {
                    seal.reject(DisneyError(message: "Cannot find the bundle"))
                    return
                }
                bundle = moduleBundle
            } else if let name = data?.authURL, name.isEmpty == false {
                let bundleIdentifier = String(name)
                guard let moduleBundle = Bundle(identifier: bundleIdentifier) else {
                    seal.reject(DisneyError(message: "Cannot find the bundle"))
                    return
                }
                bundle = moduleBundle
            }
            
            guard let url = bundle.url(forResource: path, withExtension: ".json") else {
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
