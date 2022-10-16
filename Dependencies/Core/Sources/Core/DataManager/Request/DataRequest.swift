//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 10/10/2022.
//

import Foundation

public enum DataRequestType {
    case REST, GRAPHQL, MOCK, PLIST
}

public enum NetworkRequestMethod: String {
    case GET, POST, PUT, DELETE
}

public struct DataRequest {
    public let name: String
    public let type: DataRequestType
    public let method: NetworkRequestMethod
    public let path: String
    public let headers: [String: String]?
    public let body: [String: Any]?
    
    public init(name: String = "",
                type: DataRequestType,
                method: NetworkRequestMethod = .GET,
                path: String,
                headers: [String : String]? = nil,
                body: [String : Any]? = nil) {
        self.name = name
        self.type = type
        self.method = method
        self.path = path
        self.headers = headers
        self.body = body
    }
}
