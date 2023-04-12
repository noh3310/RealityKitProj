//
//  ContentView.swift
//  SwiftUIRealityKitTest
//
//  Created by 노건호 on 2023/04/10.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(modelConfirmedForPlacement: $viewModel.modelConfirmedForPlacement)
            
            if viewModel.isPlacementEnabled {
                PlacementButtonsView(isPlacementEnabled: $viewModel.isPlacementEnabled, selectedModel: $viewModel.selectedModel, modelConfirmedForPlacement: $viewModel.modelConfirmedForPlacement)
            } else {
                ModelPickerView(isPlacementEnabled: $viewModel.isPlacementEnabled, selectedModel: $viewModel.selectedModel, models: viewModel.models)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
