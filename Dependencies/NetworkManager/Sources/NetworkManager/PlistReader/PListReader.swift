//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import PromiseKit
import Core

public class PListReader: DataProviderClientProtocol {
    
    public init() {
        
    }
    
    public func executeRequest<T: Codable>(_ type: T.Type, request: DataRequest) -> Response<T> {
        return Promise { seal in
            var bundle = Bundle.main
            
            if request.name.isEmpty == false {
                let bundleIdentifier = String(request.name)
                guard let moduleBundle = Bundle(identifier: bundleIdentifier) else {
                    seal.reject(DisneyError(message: "Cannot find bundle identifier"))
                    return
                }
                bundle = moduleBundle
            }
            
            guard let filePath = bundle.path(forResource: request.path, ofType: "plist") else {
                seal.reject(DisneyError(message: "Cannot find the file in the bundle"))
                return
            }
            
            let url = URL(fileURLWithPath: filePath)
            do {
                let data = try Data(contentsOf: url)
                let dataModel = try PropertyListDecoder().decode(type, from: data)
                seal.fulfill(dataModel)
            } catch {
                seal.reject(DisneyError(message: "Unable to find the file"))
                return
            }
        }
    }
}
