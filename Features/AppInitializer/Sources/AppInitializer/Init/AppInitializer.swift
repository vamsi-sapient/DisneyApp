import SwiftUI
import Core
import NetworkManager
import DisneyUIKit

public struct AppInitializer {

    private let dataManager: DataManagerProtocol
    private let themeManager: ThemeManagerProtocol

    public init(environmentData: EnvironmentData? = nil) {

        let authTokenManager = AuthManager()
        let crashlytics = DefaultCrashlytics()
        let restClient = RestNetworkClient(crashlytics: crashlytics, authTokenManager: authTokenManager)
        let networkManager = NetworkManager(crashlytics: crashlytics,
                                            restClient: restClient,
                                            graphqlClient: nil,
                                            mockNetworkClient: nil)
        
        if let environmentData = environmentData {
            networkManager.setEnvironmentData(environmentData)
        }

        self.themeManager = ThemeManager()
        dataManager = DataManager(crashlytics: crashlytics,
                                  authTokenManager: authTokenManager,
                                  networkManager: networkManager,
                                  plistReader: PListReader()
                                  )
        NavigationManager.initializeNavigationManager(crashlytics: crashlytics)
    }

    public func readDataManager() -> DataManagerProtocol {
        return dataManager
    }

    public func readThemeManager() -> ThemeManagerProtocol {
        return themeManager
    }
}
