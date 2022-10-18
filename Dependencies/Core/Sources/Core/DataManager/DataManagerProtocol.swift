//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 10/10/2022.
//

import Foundation
import PromiseKit

public protocol DataManagerProtocol {
    func storeTokens(authToken: String, refreshToken: String?)
    func setEnvironmentData(_ data: EnvironmentData)
    func request<T: Codable>(_ type: T.Type, request: DataRequest) -> Response<T>
}
