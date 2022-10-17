//
//  File.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 07/10/2022.
//

import Foundation

open class BaseStateObject: ObservableObject {
    @Published public var showProgress = false
    
    public init() {
        
    }
    
    public init(showProgress: Bool = false) {
        self.showProgress = showProgress
    }
}
