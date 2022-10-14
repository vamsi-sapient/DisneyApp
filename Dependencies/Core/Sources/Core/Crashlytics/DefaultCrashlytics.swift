//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 10/10/2022.
//

import Foundation
import OSLog

public final class DefaultCrashlytics: CrashlyticsProtocol {
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "", category: "")
    
    public init() {
        
    }
    
    public func initializeCrashlytics() {
        
    }
    
    public func recordCrashes(_ message: String) {
        logger.critical("\(message)")
    }
    
    public func recordError(_ message: String) {
        logger.error("\(message)")
    }
    
    public func recordTrace(_ message: String) {
        logger.trace("\(message)")
    }
    
    public func recordLog(_ message: String) {
        logger.info("\(message)")
    }
    
    public func startPerformanceMonitoring(identifier: String) {
        
    }
    
    public func endPerformanceMonitoring(identifier: String, message: String?) {
        
    }
}
