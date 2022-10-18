//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 10/10/2022.
//

import Foundation
import PromiseKit
import Core

public final class RestNetworkClient: NSObject, DataProviderClientProtocol {
    
    private var environment: EnvironmentData?
    
    private lazy var session = URLSession.shared
    private let crashlytics: CrashlyticsProtocol
    private let authTokenManager: AuthManagerProtocol
    
    required public init(crashlytics: CrashlyticsProtocol, authTokenManager: AuthManagerProtocol) {
        self.crashlytics = crashlytics
        self.authTokenManager = authTokenManager
        super.init()
        self.session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
    }
    
    public func setEnvironmentData(_ data: EnvironmentData) {
        environment = data
    }
    
    public func executeRequest<T: Codable>(_ type: T.Type, request: DataRequest) -> Response<T> {
        return Promise { [weak self] seal in
            guard let weakself = self, let environment = weakself.environment else {
                seal.reject(DisneyError(message: "Instance is destroyed"))
                return
            }
            
            
            guard let url = URL(string: servicePath(environment, request: request)) else {
                weakself.crashlytics.recordError("Could not convert the string to URL")
                seal.reject(DisneyError(message: "Could not convert the string to URL"))
                return
            }
            var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: NetworkManagerConstants.timeout)
            urlRequest.httpMethod = request.method.rawValue
            
            if let body = request.body {
                do {
                    let bodyData = try JSONSerialization.data(withJSONObject: body, options: [.prettyPrinted])
                    urlRequest.httpBody = bodyData
                } catch {
                    weakself.crashlytics.recordError("Could not convert the body parameters")
                    seal.reject(DisneyError(message: "Could not convert the body parameters"))
                }
            }
            
            request.headers?.forEach({ key, value in
                urlRequest.setValue(value, forHTTPHeaderField: key)
            })
            
            if request.apiType == .AUTH, let authToken = authTokenManager.getAuthToken(),
               let authTokenHeader = environment.authTokenHeader {
                urlRequest.setValue(authToken, forHTTPHeaderField: authTokenHeader)
            }
            
            let task = session.dataTask(with: urlRequest) { data, response, error in
                guard error == nil else {
                    weakself.crashlytics.recordError(error!.localizedDescription)
                    seal.reject(error!)
                    return
                }
                
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    if statusCode >= 400 {
                        weakself.crashlytics.recordError("Network Request Failed with \(statusCode)")
                        seal.reject(DisneyError(message: "Network Request Failed with \(statusCode)"))
                        return
                    }
                }
                
                // Conversion
                guard let data = data else {
                    weakself.crashlytics.recordError("Empty Data")
                    seal.reject(DisneyError(message: "Empty Data"))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedObject = try decoder.decode(type, from: data)
                    seal.fulfill(decodedObject)
                    
                } catch {
                    weakself.crashlytics.recordError("Could not deserialize the data")
                    seal.reject(error)
                }
            }
            task.resume()
        }
    }
    
    private func servicePath(_ environment: EnvironmentData, request: DataRequest) -> String {
        var baseURL = ""
        
        switch request.apiType {
        case .AUTH:
            baseURL = environment.authURL
            
        case .CRM:
            baseURL = environment.crmURL ?? environment.unauthURL
            
        case .CUSTOM:
            baseURL = ""
            
        default:
            baseURL = environment.unauthURL
        }
        
        return baseURL + request.path
    }
}

extension RestNetworkClient: URLSessionDelegate {
    
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge,
                           completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        //Trust the certificate even if not valid (for assignment)
        let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        completionHandler(.useCredential, urlCredential)
    }
}
