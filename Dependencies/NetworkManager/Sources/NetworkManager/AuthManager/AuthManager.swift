//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 17/10/2022.
//

import Foundation

public final class AuthManager: AuthManagerProtocol {
    
    private var authToken: String?
    private var refreshToken: String?
    
    public init() {
    }
    
    public func getAuthToken() -> String? {
        return authToken
    }
    
    public func getRefreshToken() -> String? {
        return refreshToken
    }
    
    public func storeTokens(authToken: String, refreshToken: String?) {
        self.authToken = authToken
        self.refreshToken = refreshToken
    }
    
    public func clearTokens() {
        authToken = nil
        refreshToken = nil
    }
}
