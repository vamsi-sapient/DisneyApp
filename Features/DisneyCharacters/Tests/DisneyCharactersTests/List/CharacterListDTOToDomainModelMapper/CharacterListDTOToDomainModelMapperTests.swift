//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 21/10/2022.
//

import XCTest
import Core
import NetworkManager

@testable import DisneyCharacters

final class CharacterListDTOToDomainModelMapperTests: BaseTestCase {
    private var mapper = CharacterListDTOToDomainModelMapper()
    
    func testTransform() {
        let data = mapper.transform(dto: CharacterListDTOModel(characters: [CharacterDTOData(_id: 1,
                                                                                           name: "name",
                                                                                           imageUrl: "image",
                                                                                           url: "url",
                                                                                           films: ["films"],
                                                                                           tvShows: ["tvshows"],
                                                                                           videoGames: ["videoGames"])
                                                                            ]
                                                               )
                                   )
        guard let domainModel = data as? CharacterListDomainModel else {
            XCTFail("Cannot convert to detail domain model")
            return
        }
        XCTAssertEqual(domainModel.characters.count, 1)
        
        guard let firstCharacter = domainModel.characters.first else {
            XCTFail("Cannot find the character")
            return
        }
        
        XCTAssertEqual(firstCharacter.id, 1)
        XCTAssertEqual(firstCharacter.name, "name")
        XCTAssertEqual(firstCharacter.imageUrl, "image")
        XCTAssertEqual(firstCharacter.url, "url")
        XCTAssertEqual(firstCharacter.films, ["films"])
        XCTAssertEqual(firstCharacter.tvShows, ["tvshows"])
        XCTAssertEqual(firstCharacter.videoGames, ["videoGames"])
    }
    
    func testTransformFailure() {
        let data = mapper.transform(dto: MockCharactetListDTOModel())
        guard let domainModel = data as? CharacterListDomainModel else {
            XCTFail("Cannot convert to detail domain model")
            return
        }
        XCTAssertEqual(domainModel.characters.count, 0)
    }
}
