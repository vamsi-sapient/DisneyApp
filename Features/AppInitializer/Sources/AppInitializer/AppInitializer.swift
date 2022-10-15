import SwiftUI
import Core
import NetworkManager
import DisneyUIKit

public struct AppInitializer {
    
    private let dataManager: DataManagerProtocol
    private let themeManager: ThemeManagerProtocol
    
    public init(themeManager: ThemeManagerProtocol) {
        
        let crashlytics = DefaultCrashlytics()
        let restClient = RestNetworkClient(crashlytics: crashlytics)
        
        self.themeManager = themeManager
        dataManager = DataManager(crashlytics: crashlytics,
                                  plistReader: PListReader(),
                                  restClient: restClient,
                                  graphqlClient: nil,
                                  mockNetworkClient: nil)
        NavigationManager.initializeNavigationManager(crashlytics: crashlytics)
    }
    
    public func body(_ initialView: some View) -> some View {
        return NavigationView {
            initialView
        }
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = themeManager.colorFor(viewType: ViewType.navigationBar.rawValue,
                                                                      viewSubType: nil)
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: themeManager.colorFor(viewType: ViewType.navigationBarTitle.rawValue, viewSubType: nil),
                                              NSAttributedString.Key.font: themeManager.uiFontFor(viewType: ViewType.navigationBarTitle.rawValue, viewSubType: nil)
                                             ]

            // Inline appearance (standard height appearance)
            UINavigationBar.appearance().standardAppearance = appearance
            // Large Title appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    public func readDataManager() -> DataManagerProtocol {
        return dataManager
    }
    
    public func readThemeManager() -> ThemeManagerProtocol {
        return themeManager
    }
}
