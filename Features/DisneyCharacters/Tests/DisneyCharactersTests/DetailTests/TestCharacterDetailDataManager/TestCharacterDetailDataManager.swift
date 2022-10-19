//
//  TestCharacterDetailDataManager.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 19/10/22.
//

import XCTest
import Core
import NetworkManager

@testable import DisneyCharacters

final class TestCharacterDetailDataManager: XCTestCase {
    
    private let characterDetailDataManager: CharacterDetailDataManager
    private let dataManager: DataManager
    
    override init() {
        let networkManager = NetworkManager(crashlytics: nil,
                                            restClient: nil,
                                            graphqlClient: nil,
                                            mockNetworkClient: MockNetworkClient(crashlytics: nil, authTokenManager: nil)
                                           )
        dataManager = DataManager(crashlytics: nil,
                                  authTokenManager: nil,
                                  networkManager: networkManager,
                                  plistReader: nil)
        characterDetailDataManager = CharacterDetailDataManager(dataManager: dataManager)
        super.init()
    }
    
    func testCharacterDetailDataManagerSuccessForMandatoryProperties() {
        
        guard let url = MockCharacterListDTOModel.characterListDTOModel.characters.first?.url else {return}
        
        characterDetailDataManager.getCharacterDetails("").done { model in
            XCTAssert(model._id != MockCharacterDetailDTOModel.defaultID)
            XCTAssert(model.name.count > 0)
            XCTAssert(model.name != MockCharacterDetailDTOModel.defaultName)
        
        }.catch { _ in
            
        }
        
    }
    
//    func testCharacterDetailDTOModelForProperImageUrl() {
//
//        mockDataManager.characterDetailDTOModel = MockCharacterDetailDTOModel.characterDetailDTOModel
//
//        guard let characterDetailDataManager = characterDetailDataManager else { return }
//        guard let url = MockCharacterListDTOModel.characterListDTOModel.characters.first?.url else {return}
//
//        characterDetailDataManager.getCharacterDetails(url).done { model in
//
//            if let imageUrl = model.imageUrl {
//
//                XCTAssert(imageUrl.contains("https://"))
//                XCTAssert(imageUrl.contains(".png"))
//            } else {
//
//                XCTAssertNotNil(model.imageUrl)
//            }
//
//        }.catch { _ in
//
//        }
//    }
//
//    func testCharacterDetailDTOModelForFailure() {
//
//        let expecatation = expectation(description: "Failure")
//
//        mockDataManager.error = DisneyError(message: "CharacterDetailDTOModel is nil")
//        guard let characterDetailDataManager = characterDetailDataManager else { return }
//        guard let url = MockCharacterListDTOModel.characterListDTOModel.characters.first?.url else {return}
//
//        characterDetailDataManager.getCharacterDetails(url)
//            .catch { _ in
//                expecatation.fulfill()
//
//        }
//
//        wait(for: [expecatation], timeout: 1.0)
//    }

    
}
