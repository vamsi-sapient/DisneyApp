//
//  TestCharacterListUsecase.swift
//  DisneyAppTests
//
//  Created by Vamsi Krishna Katragadda on 18/10/22.
//

import XCTest
import Core

@testable import DisneyCharacters

final class TestCharacterListUsecase: XCTestCase {
    
    let  mapper = CharacterListDTOToDomainModelMapper()
    var useCase: CharacterListUsecase?
    let repository = MockCharacterListRepository()
    
    override func setUpWithError() throws {
        useCase = CharacterListUsecase(repository: repository)
    }
    
    
    func testCharacterListUseCaseSuccess() {
        
        let expecatation = expectation(description: "Success")
        repository.characterListDTOModel = MockCharacterListDTOModel.characterListDTOModel
        repository.characterListDTOToDomainModelMapper = mapper
        
        guard let useCase = useCase else { return }
        useCase.getCharactersList().done { model in
            if model.characters.count > 1 {
                expecatation.fulfill()
            }
        }.catch { _ in
            
        }
        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testCharacterListUseCaseFailure() {
        
        let expecatation = expectation(description: "Failure")
        repository.error = DisneyError(message: "CharacterListDomainModel is not available")
        
        guard let useCase = useCase else { return }
        
        useCase.getCharactersList()
        .catch { _ in
            expecatation.fulfill()
        }
        wait(for: [expecatation], timeout: 1.0)
    }
    
}

