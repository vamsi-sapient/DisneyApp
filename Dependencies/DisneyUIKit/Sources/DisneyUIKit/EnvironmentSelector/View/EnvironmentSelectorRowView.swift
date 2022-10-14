//
//  SwiftUIView.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 11/10/2022.
//

import SwiftUI

struct EnvironmentSelectorRowView: View {
    private let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
    }
}

struct EnvironmentSelectorRowView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentSelectorRowView(title: "QA").previewLayout(.fixed(width: 300, height: 45))
    }
}
