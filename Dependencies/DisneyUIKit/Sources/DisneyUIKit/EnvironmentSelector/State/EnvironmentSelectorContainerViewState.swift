//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core

public struct Environments {
    let id = UUID()
    let title: String
}

class EnvironmentSelectorContainerViewState: BaseStateObject {
    @Published var environmentTitles = [Environments]()
}
