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

        self.themeManager = ThemeManager()
        dataManager = DataManager(crashlytics: crashlytics,
                                  plistReader: PListReader(),
                                  restClient: restClient,
                                  graphqlClient: nil,
                                  mockNetworkClient: nil)
        NavigationManager.initializeNavigationManager(crashlytics: crashlytics)
    }

    public func readDataManager() -> DataManagerProtocol {
        return dataManager
    }

    public func readThemeManager() -> ThemeManagerProtocol {
        return themeManager
    }
}
