//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 10/10/2022.
//

import Foundation
import PromiseKit
import Core

public class RestNetworkClient: NSObject, DataProviderClientProtocol {
    
    private lazy var session = URLSession.shared
    private var crashlytics: CrashlyticsProtocol
    
    public init(crashlytics: CrashlyticsProtocol) {
        self.crashlytics = crashlytics
        super.init()
        self.session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
    }
    
    public func executeRequest<T: Codable>(_ type: T.Type, request: DataRequest) -> Response<T> {
        return Promise { [weak self] seal in
            guard let url = URL(string: request.path) else {
                self?.crashlytics.recordError("Could not convert the string to URL")
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
                    self?.crashlytics.recordError("Could not convert the body parameters")
                    seal.reject(DisneyError(message: "Could not convert the body parameters"))
                }
            }
            
            request.headers?.forEach({ key, value in
                urlRequest.setValue(value, forHTTPHeaderField: key)
            })
            
            let task = session.dataTask(with: urlRequest) { data, response, error in
                guard error == nil else {
                    self?.crashlytics.recordError(error!.localizedDescription)
                    seal.reject(error!)
                    return
                }
                
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    if statusCode >= 400 {
                        self?.crashlytics.recordError("Network Request Failed with \(statusCode)")
                        seal.reject(DisneyError(message: "Network Request Failed with \(statusCode)"))
                        return
                    }
                }
                
                // Conversion
                guard let data = data else {
                    self?.crashlytics.recordError("Empty Data")
                    seal.reject(DisneyError(message: "Empty Data"))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedObject = try decoder.decode(type, from: data)
                    seal.fulfill(decodedObject)
                    
                } catch {
                    self?.crashlytics.recordError("Could not deserialize the data")
                    seal.reject(error)
                }
            }
            task.resume()
        }
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
