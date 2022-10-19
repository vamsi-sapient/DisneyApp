//
//  TestCharacterDetailRepository.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 19/10/22.
//

import XCTest
import Core

@testable import DisneyCharacters

final class TestCharacterDetailRepository: XCTestCase {
    
    var repository: CharacterDetailRepository?
    let mockCharacterDetailDataManager = MockCharacterDetailDataManager()
    let mapper = CharacterDetailDTOToDomainModelMapper()
    
    
    override func setUpWithError() throws {
        repository = CharacterDetailRepository(dataManager: mockCharacterDetailDataManager, mapper: mapper)
    }
    
    func testCharacterDetailRepositoryForSucess() {
        
        let expecatation = expectation(description: "Success")
        mockCharacterDetailDataManager.characterDetailDTOModel = MockCharacterDetailDTOModel.characterDetailDTOModel
        guard let repository = repository else { return }
        guard let url = MockCharacterListDTOModel.characterListDTOModel.characters.first?.url else {return}

        repository.getCharacterDetails(url).done{ model in
           
            if model.id != MockCharacterDetailDTOModel.defaultID && model.name != MockCharacterDetailDTOModel.defaultName && model.name.count > 0 {
                expecatation.fulfill()
            }
    
        }.catch { _ in
            
        }
        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testCharacterDetailRepositoryForFailure() {
        
        let expecatation = expectation(description: "Failure")
        mockCharacterDetailDataManager.error = DisneyError(message:"CharacterDetailDTOModel is nil")
        guard let repository = repository else { return }
        guard let url = MockCharacterListDTOModel.characterListDTOModel.characters.first?.url else {return}

        repository.getCharacterDetails(url)
            .catch { _ in
            expecatation.fulfill()

        }
        wait(for: [expecatation], timeout: 1.0)
    }
    
}
