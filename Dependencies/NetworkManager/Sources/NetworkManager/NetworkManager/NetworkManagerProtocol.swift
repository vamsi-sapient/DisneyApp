//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 16/10/2022.
//

import Foundation
import Core

public protocol NetworkManagerProtocol {
    func setEnvironmentData(_ data: EnvironmentData)
    func executeAPIRequest<T: Codable>(_ type: T.Type, request: DataRequest) -> Response<T>
}
