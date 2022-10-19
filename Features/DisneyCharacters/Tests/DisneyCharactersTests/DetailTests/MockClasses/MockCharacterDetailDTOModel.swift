//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 18/10/22.
//

import Foundation
import XCTest
@testable import DisneyCharacters


class MockCharacterDetailDTOModel {
    
    static let defaultName = "dummy"
    static let defaultID = -1

    
    
    static var characterDetailDTOModel: CharacterDetailDTOModel {
        guard let data = readLocalJSONFile(forName: "CharacterDetail") else {return  CharacterDetailDTOModel(_id: MockCharacterDetailDTOModel.defaultID, name: MockCharacterDetailDTOModel.defaultName, imageUrl: nil, url: "", films: nil, shortFilms: nil, tvShows: nil, videoGames: nil, parkAttractions: nil, allies: nil, enemies: nil)}
        guard let modal = parse(jsonData: data) else {return  CharacterDetailDTOModel(_id: MockCharacterDetailDTOModel.defaultID, name: MockCharacterDetailDTOModel.defaultName, imageUrl: nil, url: "", films: nil, shortFilms: nil, tvShows: nil, videoGames: nil, parkAttractions: nil, allies: nil, enemies: nil)}
        return modal
    }
    
    static  func readLocalJSONFile(forName name: String) -> Data? {
        do {
            
            let bundle = Bundle.module
            let url = bundle.url(forResource: name, withExtension: "json", subdirectory: "JsonResources")
            let urlreal = try XCTUnwrap(url)
            let data = try Data(contentsOf: urlreal)
            return data
            
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    
    static  func parse(jsonData: Data) -> CharacterDetailDTOModel? {
        do {
            let decodedData = try JSONDecoder().decode(CharacterDetailDTOModel.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
