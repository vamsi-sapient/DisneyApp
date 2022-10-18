import PromiseKit
import Core

public class DataManager: DataManagerProtocol {
    private let networkManager: NetworkManagerProtocol
    private var crashlytics: CrashlyticsProtocol?
    private var plistReader: LocalDataReaderClientProtocol?
    private let authTokenManager: AuthManagerProtocol
    
    public init(crashlytics: CrashlyticsProtocol,
                authTokenManager: AuthManagerProtocol,
                networkManager: NetworkManagerProtocol,
                plistReader: LocalDataReaderClientProtocol?
                ) {
        self.plistReader = plistReader
        self.crashlytics = crashlytics
        self.networkManager = networkManager
        self.authTokenManager = authTokenManager
    }
    
    public func setEnvironmentData(_ data: EnvironmentData) {
        networkManager.setEnvironmentData(data)
    }
    
    public func storeTokens(authToken: String, refreshToken: String?) {
        authTokenManager.storeTokens(authToken: authToken, refreshToken: refreshToken)
    }
    
    public func request<T: Codable>(_ type: T.Type, request: DataRequest) -> Response<T> {
        switch request.type {
        case .PLIST:
            guard let plistReader = self.plistReader else {
                return Promise { seal in
                    crashlytics?.recordError("APIHandler instance is not created")
                    seal.reject(DisneyError(message: "APIHandler instance is not created"))
                }
            }
            
            return plistReader.executeRequest(type, request: request)
            
        case .REST, .GRAPHQL, .MOCK:
            return networkManager.executeAPIRequest(type, request: request)
        }
    }
}
