//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core

public final class EnvironmentSelectorViewState: BaseStateObject {
    @Published var environmentTitles: [EnvironmentUIModel]
    @Published var selectedTitle = ""
    
    public init(environmentTitles: [EnvironmentUIModel] = [EnvironmentUIModel]()) {
        self.environmentTitles = environmentTitles
        
        super.init()
    }
}

public struct EnvironmentUIModel {
    let title: String
    let id = UUID()
}
