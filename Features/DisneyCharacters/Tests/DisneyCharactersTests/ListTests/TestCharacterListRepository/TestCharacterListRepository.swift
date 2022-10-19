//
//  TestCharacterListRepository.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 19/10/22.
//

import XCTest
import Core

@testable import DisneyCharacters

final class TestCharacterListRepository: XCTestCase {
    
    var repository: CharacterListRepository?
    let mockCharacterListDataManager = MockCharacterListDataManager()
    let mapper = CharacterListDTOToDomainModelMapper()
    
    override func setUpWithError() throws {
        repository = CharacterListRepository(dataManager: mockCharacterListDataManager, mapper: mapper)
    }
    
    func testCharacterListRepositorySuccess() {
        
        let expecatation = expectation(description: "Success")
        mockCharacterListDataManager.characterListDTOModel = MockCharacterListDTOModel.characterListDTOModel
        
        guard let repository = repository else { return }
        repository.getCharactersList().done { model in
            
            if model.characters.count > 1 {
                
                expecatation.fulfill()
            }
            
        }.catch { _ in }
        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testCharacterListRepositoryFailure() {
        
        let expecatation = expectation(description: "Failure")
        mockCharacterListDataManager.error = DisneyError(message:"CharacterListDTOModel is nil")
        
        guard let repository = repository else { return }
        repository.getCharactersList()
            .catch { _ in
                expecatation.fulfill()
            }
        wait(for: [expecatation], timeout: 1.0)
    }
    
}
