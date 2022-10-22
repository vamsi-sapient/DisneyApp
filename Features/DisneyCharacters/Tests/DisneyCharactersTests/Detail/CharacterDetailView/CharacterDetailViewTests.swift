//
//  CharacterListViewTests.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 21/10/2022.
//

import XCTest
import DisneyUIKit
import SnapshotTesting

@testable import DisneyCharacters
import AppInitializer

final class CharacterDetailViewTests: BaseTestCase {
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharacterDetailtView() throws {
        let characterDetails = [CharacterDetailUIData(title: "Title", value: "Value"),
                                CharacterDetailUIData(title: "Title1", value: "Value1"),
                                CharacterDetailUIData(title: "Title2", value: "Value2")]
        let state = CharacterDetailViewState(screenTitle: "Title",
                                             characterImageURL: "",
                                             characterDetails: characterDetails)
        
        let view = CharacterDetailView(viewModel: nil,
                                       state: state,
                                       themeManager: ThemeManager(),
                                       params: CharacterDetailNavigationParams(url: ""))
        assertSnapshots(matching: view.toViewController(), as: [.image])
    }
}
