//
//  ContentView.swift
//  DisneyApp
//
//  Created by Vamsi Krishna Katragadda on 06/10/2022.
//

import SwiftUI
import DisneyUIKit
import SharedDependencies
import Core
import DisneyCharacters

struct WelcomeView: View {
    
    @ObservedObject var result = WelcomeContainerViewResult()
    
    var body: some View {
        if result.isTimerExpired {
            NavigationManager.navigateTo(screenIdentifier: "\(ModuleNames.disneyCharacters.rawValue)_\(DisneyCharactersScreenConstants.listView.rawValue)")
        } else {
            WelcomeContainerView(fileName: WelcomeViewConstants.welcomeViewFileName, result: result)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
