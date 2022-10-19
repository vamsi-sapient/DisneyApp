//
//  TestCharacterListDataManager.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 19/10/22.
//

import XCTest
import Core

@testable import DisneyCharacters

final class TestCharacterListDataManager: XCTestCase {
    
    var characterListDataManager: CharacterListDataManager?
    let mockDataManager = MockListDataManager()
    
    override func setUpWithError() throws {
        characterListDataManager = CharacterListDataManager(dataManager: mockDataManager)
    }
    
    func testCharacterListDataManagerSuccess() {
        
        let expecatation = expectation(description: "Success")
        mockDataManager.characterListDTOModel = MockCharacterListDTOModel.characterListDTOModel
        
        guard let characterListDataManager = characterListDataManager else { return }
        characterListDataManager.getCharactersList().done { model in
            if model.characters.count > 1 {
                expecatation.fulfill()
            }
            
        }.catch { _ in
            
        }
        wait(for: [expecatation], timeout: 1.0)
        
    }
    
    func testCharacterListDataManagerFailure() {
        
        let expecatation = expectation(description: "Failure")
        mockDataManager.error = DisneyError(message: "CharacterListDTOModel is nil")
        characterListDataManager?.getCharactersList()
            .catch { error in
            print("Test Error is ",error.localizedDescription)
            expecatation.fulfill()
        }
        wait(for: [expecatation], timeout: 1.0)
        
    }
    
}
