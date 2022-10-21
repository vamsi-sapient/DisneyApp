//
//  TestCharacterDetailUsecase.swift
//  DisneyAppTests
//
//  Created by Vamsi Krishna Katragadda on 18/10/22.
//

import XCTest
import Core

@testable import DisneyCharacters

final class CharacterDetailUsecaseTests: BaseTestCase {

    private var usecase: CharacterDetailUsecase?
    
    override func setUpWithError() throws {
        setUpWithMocks(Bundle.module.bundleIdentifier)
        if let dataManager = dataManager {
            let repository = MockCharacterDetailRepository(dataManager: dataManager)
            usecase = CharacterDetailUsecase(repository: repository)
        }
    }

    func testCharacterDetailUseCaseSuccess() {
        guard let usecase = usecase else {
            XCTFail("No instance of use case")
            return
        }
        
        let expecatation = expectation(description: "Success")
        var data: CharacterDetailDomainModel?
        
        usecase.getCharacterDetails("CharacterDetailDomain").done { model in
            data = model
            expecatation.fulfill()
        }.catch { _ in
            XCTFail("Failed to get response from use case")
        }
        wait(for: [expecatation], timeout: 1.0)
        
        XCTAssert(data != nil)
        XCTAssertEqual(data?.name, ".GIFfany", "The name of the record doesnt match")
        XCTAssertEqual(data?.id, 7, "The id of the record doesnt match")
        
        if let imageUrl = data?.imageUrl {
            XCTAssert(imageUrl.contains("https://"))
            XCTAssert(imageUrl.contains(".png"))
        } else {
            XCTFail("Image url doesnt align with the format")
        }
    }
    
    func testCharacterDetailRepositoryForFailure() {
        guard let usecase = usecase else {
            XCTFail("No instance of use case")
            return
        }
        
        var data: CharacterDetailDomainModel?
        let expecatation = expectation(description: "Failure")
        usecase.getCharacterDetails("").done { model in
            data = model
            expecatation.fulfill()
        }
        .catch { error in
            expecatation.fulfill()
            XCTAssert(true)
        }
        
        wait(for: [expecatation], timeout: 1.0)
        
        XCTAssertNil(data)
    }
}

