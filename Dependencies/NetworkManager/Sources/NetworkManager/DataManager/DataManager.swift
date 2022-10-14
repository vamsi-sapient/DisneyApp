import PromiseKit
import Core

public class DataManager: DataManagerProtocol {
    private var networkManager: NetworkManager?
    private var crashlytics: CrashlyticsProtocol?
    private var plistReader: DataProviderClientProtocol?
    
    public init(crashlytics: CrashlyticsProtocol,
                plistReader: DataProviderClientProtocol?,
                restClient: DataProviderClientProtocol?,
                graphqlClient: DataProviderClientProtocol?,
                mockNetworkClient: DataProviderClientProtocol?) {
        self.plistReader = plistReader
        self.crashlytics = crashlytics
        networkManager = NetworkManager(crashlytics: crashlytics,
                                        restClient: restClient,
                                        graphqlClient: graphqlClient,
                                        mockNetworkClient: mockNetworkClient)
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
