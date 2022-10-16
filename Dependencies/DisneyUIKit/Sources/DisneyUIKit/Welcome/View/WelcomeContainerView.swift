import SwiftUI
import Core

public struct WelcomeContainerView: View {
    @ObservedObject var state = WelcomeContainerViewState()
    
    private let fileName: String
    private var viewModel: WelcomeContainerViewModel?
    
    public init(fileName: String, timeout: Double = 3, result: WelcomeContainerViewResult) {
        self.fileName = fileName
        viewModel = WelcomeContainerViewModel(timeOut: timeout, state: self.state, result: result)
    }
    
    public var body: some View {
        Color.white.edgesIgnoringSafeArea(.all).overlay(
            VStack {
                Image(fileName)
            }
        )
        .navigationBarHidden(true)
    }
}

struct WelcomeViewTemplate_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeContainerView(fileName: "welcome", result: WelcomeContainerViewResult())
    }
}
