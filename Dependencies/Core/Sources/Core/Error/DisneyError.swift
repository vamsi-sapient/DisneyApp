//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation

public class DisneyError: Error {
    
    public let message: String
    
    public init(message: String) {
        self.message = message
    }
}
