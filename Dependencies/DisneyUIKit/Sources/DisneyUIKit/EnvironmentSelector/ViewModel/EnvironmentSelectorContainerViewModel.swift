//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI

class EnvironmentSelectorContainerViewModel: BaseViewModel {
    private let state: EnvironmentSelectorContainerViewState
    private let result: EnvironmentSelectorContainerViewResult
    
    required init(environmentTitles: [String], state: EnvironmentSelectorContainerViewState, result: EnvironmentSelectorContainerViewResult) {
        self.state = state
        self.result = result
        
        super.init()
        
        var titles = [Environments]()
        environmentTitles.forEach { title in
            titles.append(Environments(title: title))
        }
        
        self.state.environmentTitles = titles
    }
}
