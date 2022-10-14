//
//  DisneyAppApp.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 06/10/2022.
//

import SwiftUI
import Core
import SharedDependencies
import DisneyCharacters
import NetworkManager
import DisneyUIKit

@main
struct DisneyAppApp: App {
    
    fileprivate let dataManager: DataManager
    
    init() {
        let crashlytics = DefaultCrashlytics()
        let restClient = RestNetworkClient(crashlytics: crashlytics)
        
        dataManager = DataManager(crashlytics: crashlytics,
                                  plistReader: PListReader(),
                                  restClient: restClient,
                                  graphqlClient: nil,
                                  mockNetworkClient: nil)
        NavigationManager.initializeNavigationManager(crashlytics: crashlytics)
        registerDisneyCharactersModule()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
//                WelcomeView()
                let localDataStore = EnvironmentSelectorDataStore(dataManager: dataManager)
                let repository = EnvironmentSelectorRepository(localDataStore: localDataStore,
                                                               mapper: EnvironmentDTOToDomainModelMapper())
                let usecase = EnvironmentSelectorUsecase(repository: repository)
                let state = EnvironmentSelectorViewState()
                EnvironmentSelectorView(viewModel: EnvironmentSelectorViewModel(usecase: usecase, state: state),
                                        state: state,
                                        themeManager: ThemeManager.shared)
            }
            .onAppear {
                let themeManager = ThemeManager.shared
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
    }
}

extension DisneyAppApp {
    fileprivate func registerDisneyCharactersModule() {
        DIContainer.registerModule(moduleName: ModuleNames.disneyCharacters.rawValue, provider: DisneyCharactersModuleDependencyProvider())
        NavigationManager.registerNavigationLinkProvider(featureName: ModuleNames.disneyCharacters.rawValue, provider: DisneyCharacterNavigationProvider())
    }
}
