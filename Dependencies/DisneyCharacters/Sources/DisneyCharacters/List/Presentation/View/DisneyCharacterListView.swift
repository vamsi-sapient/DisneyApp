//
//  SwiftUIView.swift
//  
//
//  Created by Vamsi Krishna Katragadda on 06/10/2022.
//

import SwiftUI

public struct DisneyCharacterListView: View {
    
    @ObservedObject var state: DisneyCharacterListViewState
    @ObservedObject var result: DisneyCharacterListResult
    
    public init(viewModel: DisneyCharacterListViewModelProtocol, state: DisneyCharacterListViewState, result: DisneyCharacterListResult) {
        self.result = result
        self.state = state
    }
    
    public var body: some View {
        Text("Hello, World, vamsi got it successfully!")
    }
}

struct DisneyCharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        let result = DisneyCharacterListResult()
        let state = DisneyCharacterListViewState()
        let viewModel = DisneyCharacterListViewModel(state: state, result: result)
        
        DisneyCharacterListView(viewModel: viewModel, state: state, result: result)
    }
}
