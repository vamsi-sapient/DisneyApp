//
//  TestCharacterListUsecase.swift
//  DisneyAppTests
//
//  Created by Vamsi Krishna Katragadda on 18/10/22.
//

import XCTest
import Core

@testable import DisneyCharacters

final class CharacterListUsecaseTests: BaseTestCase {

    private var usecase: CharacterListUsecase?
    
    override func setUpWithError() throws {
        setUpWithMocks(Bundle.module.bundleIdentifier)
        if let dataManager = dataManager {
            let repository = MockCharacterListRepository(dataManager: dataManager, fileName: "CharacterListDomain")
            usecase = CharacterListUsecase(repository: repository)
        }
    }

    func testCharacterListUseCaseSuccess() {
        guard let usecase = usecase else {
            XCTFail("No instance of use case")
            return
        }
        
        let expecatation = expectation(description: "Success")
        var data: CharacterListDomainModel?
        
        usecase.getCharactersList().done { model in
            data = model
            expecatation.fulfill()
        }.catch { _ in
            XCTFail("Failed to get response from use case")
        }
        wait(for: [expecatation], timeout: 1.0)
        
        XCTAssertNotNil(data)
        XCTAssertEqual(data?.characters.count, 50, "records dont match")
    }
    
    func testCharacterListRepositoryForFailure() {
        guard var usecase = self.usecase else {
            XCTFail("No instance of use case")
            return
        }
        
        if let dataManager = dataManager {
            let repository = MockCharacterListRepository(dataManager: dataManager, fileName: "CharacterListDomainFailure")
            usecase = CharacterListUsecase(repository: repository)
        }
        
        var data: CharacterListDomainModel?
        let expecatation = expectation(description: "Failure")
        usecase.getCharactersList().done { model in
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

