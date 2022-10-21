//
//  TestCharacterDetailDataManager.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 19/10/22.
//

import XCTest
import Core
import NetworkManager

@testable import DisneyCharacters

final class CharacterDetailDataManagerTests: BaseTestCase {
    private var characterDetailDataManager: CharacterDetailDataManager?
    
    override func setUpWithError() throws {
        setUpWithMocks(Bundle.module.bundleIdentifier)
        if let dataManager = dataManager {
            characterDetailDataManager = CharacterDetailDataManager(dataManager: dataManager)
        }
    }
    
    func testCharacterDetailDataManagerSuccessForMandatoryProperties() {
        var data: CharacterDetailDTOModel?
        let expectation = XCTestExpectation()

        guard let characterDetailDataManager = self.characterDetailDataManager else {
            XCTFail("Cannot read bundle identifier")
            return
        }
                     
        characterDetailDataManager.getCharacterDetails("CharacterDetail").done { model in
            data = model
            expectation.fulfill()
        }.catch { _ in
            XCTFail("Unable to read character details")
        }
                     
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(data?.name, ".GIFfany", "The name of the record doesnt match")
        XCTAssertEqual(data?._id, 7, "The id of the record doesnt match")
        
        if let imageUrl = data?.imageUrl {
            XCTAssert(imageUrl.contains("https://"))
            XCTAssert(imageUrl.contains(".png"))
        } else {
            XCTFail("Image url doesnt align with the format")
        }
    }
}
