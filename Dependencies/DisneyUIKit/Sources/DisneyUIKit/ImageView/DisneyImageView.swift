//
//  SwiftUIView.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 17/10/2022.
//

import SwiftUI
import NukeUI

public struct DisneyImageView: View {
    let url: String
    
    public init(url: String) {
        self.url = url
    }
    
    public var body: some View {
        let imageURL = URL(string: url)
        NukeUI.LazyImage(url: imageURL)
    }
}

struct DisneyImageView_Previews: PreviewProvider {
    static var previews: some View {
        DisneyImageView(url: "")
    }
}
