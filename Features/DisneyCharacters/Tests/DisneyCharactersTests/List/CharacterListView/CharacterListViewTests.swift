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

final class CharacterListViewTests: BaseTestCase {
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharacterListView() throws {
        var uiData = [CharacterUIData]()
        
        for index in 1...10 {
            let data = CharacterUIData(id: index,
                                       name: "Name\(index)",
                                       imageUrl: nil,
                                       url: "",
                                       films: nil,
                                       tvShows: nil,
                                       videoGames: nil)
            uiData.append(data)
        }
        
        let state = CharacterListViewState(characters: uiData)
        
        let view = CharacterListView(viewModel: nil,
                                     state: state,
                                     themeManager: ThemeManager())
        assertSnapshots(matching: view.toViewController(), as: [.image])
    }
}
