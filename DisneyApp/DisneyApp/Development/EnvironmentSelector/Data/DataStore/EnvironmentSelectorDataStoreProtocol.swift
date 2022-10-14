//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI

protocol EnvironmentSelectorDataStoreProtocol {
    func getEnvironmentsList() -> Response<EnvironmentDTOModel>
}
