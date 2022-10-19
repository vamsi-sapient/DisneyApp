//
//  TestCharacterDetailViewModel.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 19/10/22.
//

import XCTest
import SwiftUI
import Core

@testable import DisneyCharacters

final class TestCharacterDetailViewModel: XCTestCase {

   @ObservedObject  var state = CharacterDetailViewState()
    var viewModel: CharacterDetailViewModel?
    var useCase =  MockCharacterDetailUsecase()
   
    override func setUpWithError() throws {
        viewModel = CharacterDetailViewModel(usecase: useCase, state: state)
    }

    func testCharacterDetailViewModelForSucess() {
        
        let expecatation = expectation(description: "Success")
        let detailDto = MockCharacterDetailDTOModel.characterDetailDTOModel
        
        useCase.characterDetailDomainModel = CharacterDetailDTOToDomainModelMapper().transform(dto: detailDto) as? CharacterDetailDomainModel
        guard let viewModel = viewModel else { return }
        guard let url = MockCharacterListDTOModel.characterListDTOModel.characters.first?.url else {return}
       
        viewModel.getCharacterDetails(CharacterDetailNavigationParams(url:url))
        
        RunLoop.main.run(mode: .default, before: .distantPast)
        if state.characterImageURL.count > 0 {
            expecatation.fulfill()
        }
        
        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testCharacterDetailViewModelForFailure() {
        
        let expecatation = expectation(description: "Failure")
        let detailDto = MockCharacterDetailDTOModel.characterDetailDTOModel
        
        useCase.error = DisneyError(message: "CharacterDetailDomainModel is nil")
        guard let viewModel = viewModel else { return }
        guard let url = MockCharacterListDTOModel.characterListDTOModel.characters.first?.url else {return}
       
        viewModel.getCharacterDetails(CharacterDetailNavigationParams(url:url))
        
        RunLoop.main.run(mode: .default, before: .distantPast)
        if state.characterDetails.count == 0 {
            expecatation.fulfill()
        }
        
        wait(for: [expecatation], timeout: 1.0)
    }

}
