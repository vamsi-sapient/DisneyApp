//
//  DisneyAppUITests.swift
//  DisneyAppUITests
//
//  Created by Vamsi Krishna Katragadda on 06/10/2022.
//

import XCTest


final class DisneyAppUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication()
        XCUIDevice.shared.orientation = .portrait
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharacterList() throws {
        // UI tests must launch the application that they test.
        
        // swiftlint:disable line_length
        
        let matches = ["'Olu Mel", ".GIFfany", "627", "9-Eye", "90's Adventure Bear"]
        let environmentSelectorView = app.collectionViews["EnvironmentSelectorView"]
        if environmentSelectorView.waitForExistence(timeout: 5) {
            let qaEnvironment = environmentSelectorView/*@START_MENU_TOKEN@*/.staticTexts["QA"]/*[[".cells.staticTexts[\"QA\"]",".staticTexts[\"QA\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            qaEnvironment.tap()
            sleep(5)
            let disneyCharacterList = app.collectionViews["CharacterListView"]
            if disneyCharacterList.waitForExistence(timeout: 5) {
                let rows = disneyCharacterList.cells
                for index in 0...4 {
                    let matchString = matches[index]
                    disneyCharacterList.buttons["\(matchString)-\(matchString)"].tap()
                    XCTAssertTrue(app.navigationBars[matchString].staticTexts[matchString].exists)
                    sleep(10)
                    // Back
                    app.navigationBars.buttons.element(boundBy: 0).tap()
                }
            } else {
                XCTFail("Unable to find the Disney Character List view")
            }
        } else {
            XCTFail("Unable to find the environment selector view")
        }
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 15.0, tvOS 15.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
