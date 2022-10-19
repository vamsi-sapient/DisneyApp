//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 18/10/22.
//

import Foundation
import XCTest
@testable import DisneyCharacters


class MockCharacterListDTOModel {

    static var characterListDTOModel: CharacterListDTOModel {
        guard let data = readLocalJSONFile(forName: "CharacterList") else {return  CharacterListDTOModel(characters: []) }
        guard let modal = parse(jsonData: data) else {return CharacterListDTOModel(characters: []) }
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
    
    
    static  func parse(jsonData: Data) -> CharacterListDTOModel? {
        do {
            let decodedData = try JSONDecoder().decode(CharacterListDTOModel.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
