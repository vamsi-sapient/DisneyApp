//
//  TestCharacterDetailUsecase.swift
//  DisneyAppTests
//
//  Created by Vamsi Krishna Katragadda on 18/10/22.
//

import XCTest
import Core

@testable import DisneyCharacters

final class TestCharacterDetailUsecase: XCTestCase {
    
    let  mapper = CharacterDetailDTOToDomainModelMapper()
    var useCase: CharacterDetailUsecase?
    let repository = MockCharacterDetailRepository()
    
    override func setUpWithError() throws {
        useCase = CharacterDetailUsecase(repository: repository)
    }
    
    
    func testCharacterDetailUseCaseSuccess() {
        
        let expecatation = expectation(description: "Success")
        repository.characterDetailDTOModel = MockCharacterDetailDTOModel.characterDetailDTOModel
        repository.characterDetailDTOToDomainModelMapper = mapper
        
        guard let useCase = useCase else { return }
        guard let url = MockCharacterListDTOModel.characterListDTOModel.characters.first?.url else {return}

        useCase.getCharacterDetails(url).done { model in
            if model.id != MockCharacterDetailDTOModel.defaultID && model.name != MockCharacterDetailDTOModel.defaultName && model.name.count > 0 {
                expecatation.fulfill()
            }
                    
        }.catch { _ in
            
        }
        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testCharacterDetailUseCaseFailure() {
        
        let expecatation = expectation(description: "Failure")
        repository.error = DisneyError(message: "CharacterDetailDomainModel is not available")
        
        guard let useCase = useCase else { return }
        guard let url = MockCharacterListDTOModel.characterListDTOModel.characters.first?.url else {return}

        useCase.getCharacterDetails(url)
        .catch { _ in
            expecatation.fulfill()

        }
        wait(for: [expecatation], timeout: 1.0)
    }
    
}

