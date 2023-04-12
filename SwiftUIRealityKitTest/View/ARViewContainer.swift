//
//  ARViewContainer.swift
//  SwiftUIRealityKitTest
//
//  Created by 노건호 on 2023/04/11.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var modelConfirmedForPlacement: Model?
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        //
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
        arView.session.run(config)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
        if let model = modelConfirmedForPlacement {
            
            if let modelEntity = model.modelEntity {
                let anchorEntity = AnchorEntity(.camera)
                
                anchorEntity.addChild(modelEntity.clone(recursive: true))
                
                uiView.scene.addAnchor(anchorEntity)
            } else {
                print("unable")
            }
            
            DispatchQueue.main.async {
                modelConfirmedForPlacement = nil
            }
        }
        
    }
    
}
