//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 07/10/2022.
//

import Foundation

public protocol ModuleDependencyProviderProtocol {
    func provideViewModelAndState(screenName: String) -> (BaseViewModel?, BaseStateObject?)
}
