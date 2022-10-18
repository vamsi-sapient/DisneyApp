//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 13/10/2022.
//

import Foundation
import Core

public final class PListReader: LocalDataReaderClientProtocol {
    
    private let crashlytics: CrashlyticsProtocol
    
    required public init(crashlytics: CrashlyticsProtocol) {
        self.crashlytics = crashlytics
    }
    
    public func executeRequest<T: Codable>(_ type: T.Type, request: DataRequest) -> T? {
        var bundle = Bundle.main
        
        if request.name.isEmpty == false {
            let bundleIdentifier = String(request.name)
            guard let moduleBundle = Bundle(identifier: bundleIdentifier) else {
                crashlytics.recordError("Cannot find bundle identifier")
                return nil
            }
            bundle = moduleBundle
        }
        
        guard let filePath = bundle.path(forResource: request.path, ofType: "plist") else {
            crashlytics.recordError("Cannot find the file in the bundle")
            return nil
        }
        
        let url = URL(fileURLWithPath: filePath)
        do {
            let data = try Data(contentsOf: url)
            let dataModel = try PropertyListDecoder().decode(type, from: data)
            return dataModel
        } catch {
            crashlytics.recordError("Unable to find the file")
            return nil
        }
    }
}
