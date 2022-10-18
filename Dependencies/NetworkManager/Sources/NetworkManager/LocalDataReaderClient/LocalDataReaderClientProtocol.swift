//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 16/10/2022.
//

import Foundation
import Core

public protocol LocalDataReaderClientProtocol {
    init(crashlytics: CrashlyticsProtocol)
    func executeRequest<T: Codable>(_ type: T.Type, request: DataRequest) -> T?
}
