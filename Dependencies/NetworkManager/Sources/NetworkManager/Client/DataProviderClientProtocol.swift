//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 10/10/2022.
//

import Foundation
import Core

public protocol DataProviderClientProtocol {
    init(crashlytics: CrashlyticsProtocol, authTokenManager: AuthManagerProtocol)
    func setEnvironmentData(_ data: EnvironmentData)
    func executeRequest<T: Codable>(_ type: T.Type, request: DataRequest) -> Response<T>
}
