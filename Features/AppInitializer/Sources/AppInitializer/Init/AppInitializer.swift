import SwiftUI
import Core
import NetworkManager
import DisneyUIKit

public struct AppInitializer {

    private let dataManager: DataManagerProtocol
    private let themeManager: ThemeManagerProtocol
    private let plistReader: LocalDataReaderClientProtocol
    private let crashlytics: CrashlyticsProtocol

    public init(environmentData: EnvironmentData? = nil) {

        let authTokenManager = AuthManager()
        crashlytics = DefaultCrashlytics()
        let restClient = RestNetworkClient(crashlytics: crashlytics, authTokenManager: authTokenManager)
        let networkManager = NetworkManager(crashlytics: crashlytics,
                                            restClient: restClient,
                                            graphqlClient: nil,
                                            mockNetworkClient: nil)
        
        if let environmentData = environmentData {
            networkManager.setEnvironmentData(environmentData)
        }

        self.themeManager = ThemeManager()
        self.plistReader = PListReader(crashlytics: crashlytics)
        dataManager = DataManager(crashlytics: crashlytics,
                                  authTokenManager: authTokenManager,
                                  networkManager: networkManager,
                                  plistReader: plistReader
                                  )
        NavigationManager.initializeNavigationManager(crashlytics: crashlytics)
    }

    public func readDataManager() -> DataManagerProtocol {
        return dataManager
    }

    public func readThemeManager() -> ThemeManagerProtocol {
        return themeManager
    }
    
    public func readPListReader() -> LocalDataReaderClientProtocol {
        return plistReader
    }
    
    public func readCrashlytics() -> CrashlyticsProtocol {
        return crashlytics
    }
}
