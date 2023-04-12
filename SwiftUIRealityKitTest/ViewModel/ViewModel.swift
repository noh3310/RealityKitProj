//
//  ViewModel.swift
//  SwiftUIRealityKitTest
//
//  Created by 노건호 on 2023/04/11.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var isPlacementEnabled = false
    @Published var selectedModel: Model?
    @Published var modelConfirmedForPlacement: Model?
    
    @Published var models: [Model] = {
        let filemanager = FileManager.default
        
        guard let path = Bundle.main.resourcePath, let files = try? filemanager.contentsOfDirectory(atPath: path) else {
            return []
        }
        
        var availableModels: [Model] = []
        for fileName in files where fileName.hasSuffix("usdz") {
            let modelName = fileName.replacingOccurrences(of: ".usdz", with: "")
            let model = Model(modelName: modelName)
            availableModels.append(model)
        }
        return availableModels
    }()
}
