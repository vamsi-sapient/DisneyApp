//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import SwiftUI

public protocol NavigationProviderProtocol {
    func screen(for screenIdentifier: String, params: NavigationParams?) -> AnyView?
}
