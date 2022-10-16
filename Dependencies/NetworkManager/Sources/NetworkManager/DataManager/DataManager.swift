import PromiseKit
import Core

public class DataManager: DataManagerProtocol {
    private var networkManager: NetworkManagerProtocol?
    private var crashlytics: CrashlyticsProtocol?
    private var plistReader: LocalDataReaderClientProtocol?
    
    public init(crashlytics: CrashlyticsProtocol,
                networkManager: NetworkManagerProtocol,
                plistReader: LocalDataReaderClientProtocol?
                ) {
        self.plistReader = plistReader
        self.crashlytics = crashlytics
    }
    
    public func setEnvironmentData(_ data: EnvironmentData) {
        networkManager?.setEnvironmentData(data)
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
            guard let networkManager = self.networkManager else {
                return Promise { seal in
                    crashlytics?.recordError("APIHandler instance is not created")
                    seal.reject(DisneyError(message: "APIHandler instance is not created"))
                }
            }
            return networkManager.executeAPIRequest(type, request: request)
        }
    }
}
