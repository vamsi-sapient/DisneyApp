//
//  TestCharacterListDataManager.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 19/10/22.
//

import XCTest
import Core

@testable import DisneyCharacters

final class CharacterListDataManagerTests: BaseTestCase {
    private var characterListDataManager: CharacterListDataManager?
    
    override func setUpWithError() throws {
        setUpWithMocks(Bundle.module.bundleIdentifier)
        if let dataManager = dataManager {
            dataManager.setEnvironmentData(EnvironmentData(name: "CharacterList",
                                                           unauthURL: "",
                                                           authURL: Bundle.module.bundleIdentifier ?? "",
                                                           crmURL: nil,
                                                           authTokenHeader: nil))
            characterListDataManager = CharacterListDataManager(dataManager: dataManager)
        }
    }
    
    func testCharacterListDataManagerSuccessForMandatoryProperties() {
        var data: CharacterListDTOModel?
        let expectation = XCTestExpectation()

        guard let characterListDataManager = self.characterListDataManager else {
            XCTFail("Cannot read bundle identifier")
            return
        }
                     
        characterListDataManager.getCharactersList().done { model in
            data = model
            expectation.fulfill()
        }.catch { _ in
            XCTFail("Unable to read character Lists")
        }
                     
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertNotNil(data)
        XCTAssertEqual(data?.characters.count, 50, "records dont match")
    }
}
