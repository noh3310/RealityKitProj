//
//  ModelPickerView.swift
//  SwiftUIRealityKitTest
//
//  Created by 노건호 on 2023/04/11.
//

import SwiftUI

struct ModelPickerView: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    
    var models: [Model]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(0..<models.count, id: \.self) { index in
                    Button {
                        print("DEBUG \(models[index].modelName)")
                        
                        selectedModel = models[index]
                        self.isPlacementEnabled = true
                    } label: {
                        Image(uiImage: models[index].image)
                            .resizable()
                            .frame(height: 80)
                            .aspectRatio(1/1, contentMode: .fit)
                            .background(Color.white)
                            .cornerRadius(12)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background(Color.gray)
        }
    }
}
