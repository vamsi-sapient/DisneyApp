//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 17/10/2022.
//

import Foundation

public protocol AuthManagerProtocol {
    func getAuthToken() -> String?
    func getRefreshToken() -> String?
    
    func storeTokens(authToken: String, refreshToken: String?)
    func clearTokens()
}
