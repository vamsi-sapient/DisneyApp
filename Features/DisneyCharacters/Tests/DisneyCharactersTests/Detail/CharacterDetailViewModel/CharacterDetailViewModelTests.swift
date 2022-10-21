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

final class CharacterDetailViewModelTests: BaseTestCase {
    @ObservedObject var state = CharacterDetailViewState()
    var viewModel: CharacterDetailViewModel?

    override func setUpWithError() throws {
        setUpWithMocks(Bundle.module.bundleIdentifier)
        if let dataManager = dataManager {
            viewModel = CharacterDetailViewModel(usecase: MockCharacterDetailUsecase(dataManager: dataManager),
                                                 state: state)
        }
    }

    func testCharacterDetailViewModelForSucess() {
        let expecatation = expectation(description: "Success")

        guard let viewModel = viewModel else {
            XCTFail("No instance of view model")
            return
        }
        viewModel.getCharacterDetails(CharacterDetailNavigationParams(url: "CharacterDetailDomain"))
            
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            expecatation.fulfill()
        }
        
        wait(for: [expecatation], timeout: 2.0)
        
        XCTAssertEqual(state.screenTitle, ".GIFfany")
        XCTAssertNotEqual(state.characterDetails.count, 0)
    }
    
    func testCharacterDetailViewModelForFailed() {
        let expecatation = expectation(description: "Failure")

        guard let viewModel = viewModel else {
            XCTFail("No instance of view model")
            return
        }
        viewModel.getCharacterDetails(CharacterDetailNavigationParams(url: ""))
            
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            expecatation.fulfill()
        }
        
        wait(for: [expecatation], timeout: 2.0)
        
        XCTAssertEqual(state.screenTitle, "")
        XCTAssertEqual(state.characterDetails.count, 0)
    }
    
    func testUpdateUI() {
        guard let viewModel = viewModel else {
            XCTFail("No instance of view model")
            return
        }
        let rows = viewModel.updateUI(CharacterDetailDomainModel(id: 0,
                                                                 name: "name",
                                                                 imageUrl: "data",
                                                                 url: "data",
                                                                 films: ["films"],
                                                                 shortFilms: ["shortfilms"],
                                                                 tvShows: ["tvShows"],
                                                                 videoGames: ["videoGames"],
                                                                 parkAttractions: ["parkAttractions"],
                                                                 allies: ["allies"],
                                                                 enemies: ["enemies"])
                                     )
        XCTAssertEqual(rows.count, 7)
        
        var index = 0
        XCTAssertEqual(rows[index].values, ["films"])
        XCTAssertNil(rows[index].value)
        index += 1
        
        XCTAssertEqual(rows[index].values, ["shortfilms"])
        XCTAssertNil(rows[index].value)
        index += 1
        
        XCTAssertEqual(rows[index].values, ["tvShows"])
        XCTAssertNil(rows[index].value)
        index += 1
        
        XCTAssertEqual(rows[index].values, ["videoGames"])
        XCTAssertNil(rows[index].value)
        index += 1
        
        XCTAssertEqual(rows[index].values, ["parkAttractions"])
        XCTAssertNil(rows[index].value)
        index += 1
        
        XCTAssertEqual(rows[index].values, ["allies"])
        XCTAssertNil(rows[index].value)
        index += 1
        
        XCTAssertEqual(rows[index].values, ["enemies"])
        XCTAssertNil(rows[index].value)
    }
    
    func testUpdateUINoData() {
        guard let viewModel = viewModel else {
            XCTFail("No instance of view model")
            return
        }
        let rows = viewModel.updateUI(CharacterDetailDomainModel(id: 0,
                                                                 name: "name",
                                                                 imageUrl: "data",
                                                                 url: "data",
                                                                 films: nil,
                                                                 shortFilms: nil,
                                                                 tvShows: nil,
                                                                 videoGames:nil,
                                                                 parkAttractions: nil,
                                                                 allies: nil,
                                                                 enemies: nil)
                                     )
        XCTAssertEqual(rows.count, 7)
        
        var index = 0
        XCTAssertEqual(rows[index].value, CharacterDetailViewConstants.Titles.noData)
        XCTAssertNil(rows[index].values)
        index += 1
        
        XCTAssertEqual(rows[index].value, CharacterDetailViewConstants.Titles.noData)
        XCTAssertNil(rows[index].values)
        index += 1
        
        XCTAssertEqual(rows[index].value, CharacterDetailViewConstants.Titles.noData)
        XCTAssertNil(rows[index].values)
        index += 1
        
        XCTAssertEqual(rows[index].value, CharacterDetailViewConstants.Titles.noData)
        XCTAssertNil(rows[index].values)
        index += 1
        
        XCTAssertEqual(rows[index].value, CharacterDetailViewConstants.Titles.noData)
        XCTAssertNil(rows[index].values)
        index += 1
        
        XCTAssertEqual(rows[index].value, CharacterDetailViewConstants.Titles.noData)
        XCTAssertNil(rows[index].values)
        index += 1
        
        XCTAssertEqual(rows[index].value, CharacterDetailViewConstants.Titles.noData)
        XCTAssertNil(rows[index].values)
    }
}
