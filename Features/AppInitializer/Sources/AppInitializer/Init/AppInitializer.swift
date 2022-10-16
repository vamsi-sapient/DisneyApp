import SwiftUI
import Core
import NetworkManager
import DisneyUIKit

public struct AppInitializer {

    private let dataManager: DataManagerProtocol
    private let themeManager: ThemeManagerProtocol

    public init() {

        let crashlytics = DefaultCrashlytics()
        let restClient = RestNetworkClient(crashlytics: crashlytics)
        let networkManager = NetworkManager(crashlytics: crashlytics,
                                            restClient: restClient,
                                            graphqlClient: nil,
                                            mockNetworkClient: nil)

        self.themeManager = ThemeManager()
        dataManager = DataManager(crashlytics: crashlytics,
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
