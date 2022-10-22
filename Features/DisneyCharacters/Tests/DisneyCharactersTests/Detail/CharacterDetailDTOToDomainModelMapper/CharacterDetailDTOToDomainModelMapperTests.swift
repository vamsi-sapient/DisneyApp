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

final class CharacterDetailDTOToDomainModelMapperTests: BaseTestCase {
    private var mapper = CharacterDetailDTOToDomainModelMapper()
    
    func testTransform() {
        let data = mapper.transform(dto: CharacterDetailDTOModel(_id: 1,
                                                                 name: "name",
                                                                 imageUrl: "image",
                                                                 url: "url",
                                                                 films: ["films"],
                                                                 shortFilms: ["shortFilms"],
                                                                 tvShows: ["tvshows"],
                                                                 videoGames: ["videoGames"],
                                                                 parkAttractions: ["parkAttraction"],
                                                                 allies: ["allies"],
                                                                 enemies: ["enemies"]
                                                                )
                                   )
        guard let domainModel = data as? CharacterDetailDomainModel else {
            XCTFail("Cannot convert to detail domain model")
            return
        }
        XCTAssertEqual(domainModel.id, 1)
        XCTAssertEqual(domainModel.name, "name")
        XCTAssertEqual(domainModel.imageUrl, "image")
        XCTAssertEqual(domainModel.url, "url")
        XCTAssertEqual(domainModel.films, ["films"])
        XCTAssertEqual(domainModel.shortFilms, ["shortFilms"])
        XCTAssertEqual(domainModel.tvShows, ["tvshows"])
        XCTAssertEqual(domainModel.videoGames, ["videoGames"])
        XCTAssertEqual(domainModel.parkAttractions, ["parkAttraction"])
        XCTAssertEqual(domainModel.allies, ["allies"])
        XCTAssertEqual(domainModel.enemies, ["enemies"])
    }
    
    func testTransformFailure() {
        let data = mapper.transform(dto: MockCharactetDetailDTOModel())
        guard let domainModel = data as? CharacterDetailDomainModel else {
            XCTFail("Cannot convert to detail domain model")
            return
        }
        XCTAssertEqual(domainModel.id, 0)
        XCTAssertEqual(domainModel.name, "")
        XCTAssertNil(domainModel.imageUrl)
        XCTAssertEqual(domainModel.url, "")
        XCTAssertNil(domainModel.films)
        XCTAssertNil(domainModel.shortFilms)
        XCTAssertNil(domainModel.tvShows)
        XCTAssertNil(domainModel.videoGames)
        XCTAssertNil(domainModel.parkAttractions)
        XCTAssertNil(domainModel.allies)
        XCTAssertNil(domainModel.enemies)
    }
}
