//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 21/10/2022.
//

import SwiftUI

extension SwiftUI.View {
    public func toViewController() -> UIViewController {
        let viewController = UIHostingController(rootView: self)
        viewController.view.frame = UIScreen.main.bounds
        return viewController
    }
}
