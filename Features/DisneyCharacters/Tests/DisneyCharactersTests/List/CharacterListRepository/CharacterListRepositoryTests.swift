//
//  TestCharacterListRepository.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 19/10/22.
//

import XCTest
import Core

@testable import DisneyCharacters

final class CharacterListRepositoryTests: BaseTestCase {
    var repository: CharacterListRepository?
    let mapper = CharacterListDTOToDomainModelMapper()

    override func setUpWithError() throws {
        setUpWithMocks(Bundle.module.bundleIdentifier)
        if let dataManager = dataManager {
            dataManager.setEnvironmentData(EnvironmentData(name: "CharacterList",
                                                           unauthURL: "",
                                                           authURL: Bundle.module.bundleIdentifier ?? "",
                                                           crmURL: nil,
                                                           authTokenHeader: nil))
            repository = CharacterListRepository(dataManager: MockCharacterListDataManager(dataManager: dataManager),
                                                 mapper: mapper)
        }
    }

    func testCharacterListRepositoryForSucess() {
        var data: CharacterListDomainModel?
        let expecatation = expectation(description: "Success")
        repository?.getCharactersList().done { model in
            data = model
            expecatation.fulfill()
        }
        .catch { _ in
            XCTFail("Failed to get response from repository")
        }
        
        wait(for: [expecatation], timeout: 1.0)
        
        XCTAssertNotNil(data)
        XCTAssertEqual(data?.characters.count, 50, "records dont match")
    }
    
    func testCharacterListRepositoryForFailure() {
        if let dataManager = dataManager {
            dataManager.setEnvironmentData(EnvironmentData(name: "CharcterListRepo",
                                                           unauthURL: "",
                                                           authURL: Bundle.module.bundleIdentifier ?? "",
                                                           crmURL: nil,
                                                           authTokenHeader: nil))
        }
        
        var data: CharacterListDomainModel?
        let expecatation = expectation(description: "Failure")
        repository?.getCharactersList().done { model in
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
    
    func testCharacterListRepositoryForMapperFailure() {
        if let dataManager = dataManager {
            dataManager.setEnvironmentData(EnvironmentData(name: "CharacterList",
                                                           unauthURL: "",
                                                           authURL: Bundle.module.bundleIdentifier ?? "",
                                                           crmURL: nil,
                                                           authTokenHeader: nil))
            repository = CharacterListRepository(dataManager: MockCharacterListDataManager(dataManager: dataManager),
                                                 mapper: MockDTOToDomainModelMapper())
        }
        
        let expecatation = expectation(description: "Failure")

        var data: CharacterListDomainModel?
        repository?.getCharactersList().done { model in
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
