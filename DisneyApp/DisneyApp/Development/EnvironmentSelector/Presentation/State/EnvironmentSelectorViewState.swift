//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core

class EnvironmentSelectorViewState: BaseStateObject {
    @Published var environmentTitles: [String]
    
    init(environmentTitles: [String] = [String]()) {
        self.environmentTitles = environmentTitles
        
        super.init()
    }
}
