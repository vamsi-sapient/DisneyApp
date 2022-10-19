//
//  DisneyAppTests.swift
//  DisneyAppTests
//
//  Created by Vamsi Krishna Katragadda on 06/10/2022.
//

import XCTest
import NetworkManager
import DisneyCharacters

@testable import DisneyApp

final class DisneyAppTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
                    let networkManager = NetworkManager(crashlytics: nil,
                                                        restClient: nil,
                                                        graphqlClient: nil,
                                                        mockNetworkClient: MockNetworkClient(crashlytics: nil, authTokenManager: nil)
                                                       )
                    dataManager = DataManager(crashlytics: nil,
                                              authTokenManager: nil,
                                              networkManager: networkManager,
                                              plistReader: nil)
                    characterDetailDataManager = CharacterDetailDataManager(dataManager: dataManager!)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
        private var characterDetailDataManager: CharacterDetailDataManager?
        private var dataManager: DataManager?
        
//        override init() {
//            let networkManager = NetworkManager(crashlytics: nil,
//                                                restClient: nil,
//                                                graphqlClient: nil,
//                                                mockNetworkClient: MockNetworkClient(crashlytics: nil, authTokenManager: nil)
//                                               )
//            dataManager = DataManager(crashlytics: nil,
//                                      authTokenManager: nil,
//                                      networkManager: networkManager,
//                                      plistReader: nil)
//            characterDetailDataManager = CharacterDetailDataManager(dataManager: dataManager)
//            super.init()
//        }
        
        func testCharacterDetailDataManagerSuccessForMandatoryProperties() {
            
//            guard let url = MockCharacterListDTOModel.characterListDTOModel.characters.first?.url else {return}
            
            characterDetailDataManager?.getCharacterDetails("CharacterDetail", requestType: .MOCK).done { model in
//                XCTAssert(model._id != MockCharacterDetailDTOModel.defaultID)
//                XCTAssert(model.name.count > 0)
//                XCTAssert(model.name != MockCharacterDetailDTOModel.defaultName)
            
            }.catch { _ in
                
            }
            
        }
}
