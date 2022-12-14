//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 20/10/2022.
//

import Foundation
import XCTest
import Core
import NetworkManager

class BaseTestCase: XCTestCase {
    var app: XCUIApplication!
    var dataManager: DataManagerProtocol?
    
    func setUpWithMocks(_ bundleIdentifier: String?) {
        dataManager = MockDataManager()
        dataManager?.setEnvironmentData(EnvironmentData(name: "",
                                                        unauthURL: "",
                                                        authURL: bundleIdentifier ?? "",
                                                        crmURL: nil,
                                                        authTokenHeader: nil))
    }
    
    func captureScreenShotWith(_ app: XCUIApplication, name: String) {
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
