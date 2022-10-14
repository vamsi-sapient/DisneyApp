//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 10/10/2022.
//

import Foundation

public protocol CrashlyticsProtocol {
    func initializeCrashlytics()
    func recordCrashes(_ message: String)
    func recordError(_ message: String)
    func recordLog(_ message: String)
    func recordTrace(_ message: String)
    func startPerformanceMonitoring(identifier: String)
    func endPerformanceMonitoring(identifier: String, message: String?)
}
