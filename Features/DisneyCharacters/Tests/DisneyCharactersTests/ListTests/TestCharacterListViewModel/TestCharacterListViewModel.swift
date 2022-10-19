//
//  TestCharacterListViewModel.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 19/10/22.
//

import XCTest
import SwiftUI
import Core

@testable import DisneyCharacters

final class TestCharacterListViewModel: XCTestCase {

    @ObservedObject var state = CharacterListViewState()
    var viewModel: CharacterListViewModel?
    var useCase =  MockCharacterListUsecase()
   

    override func setUpWithError() throws {
        viewModel = CharacterListViewModel(usecase: useCase, state: state)
    }

    func testCharacterListViewModelForSuccess() {
        
        let expecatation = expectation(description: "Success")
        let detailDto = MockCharacterListDTOModel.characterListDTOModel
        
        useCase.characterListDomainModel = CharacterListDTOToDomainModelMapper().transform(dto: detailDto) as? CharacterListDomainModel
       
        guard let viewModel = viewModel else { return }
        viewModel.getCharactersList()
        
        RunLoop.main.run(mode: .default, before: .distantPast)
        if state.characters.count > 0 {
            expecatation.fulfill()
        }
        
        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testCharacterListViewModelForFailure() {
        
        let expecatation = expectation(description: "Failure")
        let detailDto = MockCharacterListDTOModel.characterListDTOModel
        
        useCase.error = DisneyError(message: "CharacterListDomainModel is nil")
       
        guard let viewModel = viewModel else { return }
        viewModel.getCharactersList()
        
        RunLoop.main.run(mode: .default, before: .distantPast)
        if state.characters.count == 0 {
            expecatation.fulfill()
        }
        
        wait(for: [expecatation], timeout: 1.0)
    }

}
