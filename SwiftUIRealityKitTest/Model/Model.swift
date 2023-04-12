//
//  Model.swift
//  SwiftUIRealityKitTest
//
//  Created by 노건호 on 2023/04/10.
//

import UIKit
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        self.image = UIImage(named: modelName)!
        
        let fileName = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: fileName)
            .sink(receiveCompletion: { loadCompletion in
                print("Error")
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
            })
    }
}
