//
//  TestCharacterDetailRepository.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 19/10/22.
//

import XCTest
import Core

@testable import DisneyCharacters

final class CharacterDetailRepositoryTests: BaseTestCase {
    var repository: CharacterDetailRepository?
    let mapper = CharacterDetailDTOToDomainModelMapper()

    override func setUpWithError() throws {
        setUpWithMocks(Bundle.module.bundleIdentifier)
        if let dataManager = dataManager {
            repository = CharacterDetailRepository(dataManager: MockCharacterDetailDataManager(dataManager: dataManager),
                                                   mapper: mapper)
        }
    }

    func testCharacterDetailRepositoryForSucess() {
        var data: CharacterDetailDomainModel?
        let expecatation = expectation(description: "Success")
        repository?.getCharacterDetails("CharacterDetail").done { model in
            data = model
            expecatation.fulfill()
        }
        .catch { _ in
            XCTFail("Failed to get response from repository")
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
        var data: CharacterDetailDomainModel?
        let expecatation = expectation(description: "Failure")
        repository?.getCharacterDetails("").done { model in
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
    
    func testCharacterDetailRepositoryForMapperFailure() {
        if let dataManager = dataManager {
            repository = CharacterDetailRepository(dataManager: MockCharacterDetailDataManager(dataManager: dataManager),
                                                   mapper: MockDTOToDomainModelMapper())
        }
        
        let expecatation = expectation(description: "Failure")

        var data: CharacterDetailDomainModel?
        repository?.getCharacterDetails("CharacterDetail").done { model in
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
