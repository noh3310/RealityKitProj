//
//  PlacementButtonsView.swift
//  SwiftUIRealityKitTest
//
//  Created by 노건호 on 2023/04/11.
//

import SwiftUI

struct PlacementButtonsView: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    @Binding var modelConfirmedForPlacement: Model?
    
    var body: some View {
        HStack {
            Button {
                print("Cancel")
                resetPlacementParameter()
            } label: {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(20)
                    .padding(20)
            }
            
            Button {
                print("Confirm")
                
                modelConfirmedForPlacement = selectedModel
                
                resetPlacementParameter()
            } label: {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(20)
                    .padding(20)
            }
        }
    }
    
    func resetPlacementParameter() {
        selectedModel = nil
        isPlacementEnabled = false
    }
}
