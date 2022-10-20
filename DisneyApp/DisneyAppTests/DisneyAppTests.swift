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

protocol BaseMockRepository {
    func readSuccessJSON(_ fileName: String)
}

extension BaseMockRepository {
    func readSuccessJSON(_ fileName: String) {
        let networkManager = NetworkManager(crashlytics: nil,
                                            restClient: nil,
                                            graphqlClient: nil,
                                            mockNetworkClient: MockNetworkClient(crashlytics: nil, authTokenManager: nil)
                                           )
        let dataManager = DataManager(crashlytics: nil,
                                      authTokenManager: nil,
                                      networkManager: networkManager,
                                      plistReader: nil)
        
        dataManager.request(, request: DataRequest()) {
            
        }
        
        MockNetworkClient.executeRequest(<#T##self: MockNetworkClient##MockNetworkClient#>)
    }
}

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
            let mockId = 7
            let mockName = ".GIFfany"
            var data: CharacterDetailDTOModel?
            
            let expectation = XCTestExpectation()
            
            guard let bundleIdentifier = Bundle(for: DisneyAppTests.self).bundleIdentifier else {
                XCTFail("Cannot read bundle identifier")
                return
            }
            
            characterDetailDataManager?.getCharacterDetails("CharacterDetailError",
                                                            name: bundleIdentifier,
                                                            requestType: .MOCK).done { model in
//                XCTAssertEqual(model._id, mockId, "The id of the record doesnt match")
                data = model
//                XCTAssertEqual(model.name, "Vamsi")
                expectation.fulfill()
            }.catch { _ in
            }
            
            wait(for: [expectation], timeout: 1.0)
            XCTAssertEqual(data?.name, mockName)
        }
}
