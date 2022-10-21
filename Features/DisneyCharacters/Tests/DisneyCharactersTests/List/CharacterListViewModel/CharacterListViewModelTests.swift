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

final class CharacterListViewModelTests: BaseTestCase {
    @ObservedObject var state = CharacterListViewState()
    var viewModel: CharacterListViewModel?

    override func setUpWithError() throws {
        setUpWithMocks(Bundle.module.bundleIdentifier)
        if let dataManager = dataManager {
            viewModel = CharacterListViewModel(usecase: MockCharacterListUsecase(dataManager: dataManager, fileName: "CharacterListDomain"),
                                               state: state)
        }
    }

    func testCharacterListViewModelForSucess() {
        let expecatation = expectation(description: "Success")

        guard let viewModel = viewModel else {
            XCTFail("No instance of view model")
            return
        }
        viewModel.getCharactersList()
            
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            expecatation.fulfill()
        }
        
        wait(for: [expecatation], timeout: 2.0)
        
        XCTAssertEqual(state.characters.count, 50)
    }
    
    func testCharacterDetailViewModelForFailed() {
        if let dataManager = dataManager {
            viewModel = CharacterListViewModel(usecase: MockCharacterListUsecase(dataManager: dataManager,
                                                                                 fileName: "CharacterListDomainFailure"),
                                               state: state)
        }
        
        let expecatation = expectation(description: "Failure")

        guard let viewModel = viewModel else {
            XCTFail("No instance of view model")
            return
        }
        viewModel.getCharactersList()
            
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            expecatation.fulfill()
        }
        
        wait(for: [expecatation], timeout: 2.0)
        
        XCTAssertEqual(state.characters.count, 0)
    }
}
