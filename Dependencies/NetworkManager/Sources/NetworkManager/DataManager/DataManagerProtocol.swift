//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 10/10/2022.
//

import Foundation
import PromiseKit
import Core

public protocol DataManagerProtocol {
    func request<T: Codable>(_ type: T.Type, request: DataRequest) -> Response<T>
}
