//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI

public class DisneyCharacterListViewModel: BaseViewModel, DisneyCharacterListViewModelProtocol {
    private let state: DisneyCharacterListViewState
    private let result: DisneyCharacterListResult
    
    required init(state: DisneyCharacterListViewState, result: DisneyCharacterListResult) {
        self.state = state
        self.result = result
        
    }
}
