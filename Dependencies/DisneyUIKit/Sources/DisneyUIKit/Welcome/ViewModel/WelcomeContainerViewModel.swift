//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 09/10/2022.
//

import Foundation
import Core
import SwiftUI

class WelcomeContainerViewModel: BaseViewModel {
    private let state: WelcomeContainerViewState
    private let result: WelcomeContainerViewResult
    
    private var timer: Timer?
    
    required init(timeOut: Double, state: WelcomeContainerViewState, result: WelcomeContainerViewResult) {
        self.state = state
        self.result = result
        
        super.init()
        startTimer(timeOut: timeOut)
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    private func startTimer(timeOut: Double) {
        timer = Timer.scheduledTimer(withTimeInterval: timeOut, repeats: false) { [weak self] _ in
            self?.result.isTimerExpired = true
        }
    }
}
