//
//  ViewController7.swift
//  YYSceneKitTest
//
//  Created by yejunyou on 2018/1/25.
//  Copyright © 2018年 yejunyou. All rights reserved.
//

import UIKit
import SceneKit

class ViewController7: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加场景视图
        let myView = SCNView.init(frame: view.bounds)
        myView.allowsCameraControl = true
        myView.backgroundColor = UIColor.black
        myView.scene = SCNScene()
        view.addSubview(myView)
        
        // 添加相机
        let camera = SCNCamera()
        camera.automaticallyAdjustsZRange = true
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3Make(0, 0, 10)
        myView.scene?.rootNode.addChildNode(cameraNode)
        
        // 添加环境光
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        /*
         public static let ambient      : SCNLight.LightType
         public static let omni         : SCNLight.LightType // Omnidirectional light
         public static let directional  : SCNLight.LightType // Directional light
         public static let spot         : SCNLight.LightType // Spot light
         public static let IES          : SCNLight.LightType // IES light
         public static let probe        : SCNLight.LightType // Light probe
         */
        ambientLightNode.light?.type = .spot
        ambientLightNode.light?.color = UIColor.white
        myView.scene?.rootNode.addChildNode(ambientLightNode)
        
        // 添加灯光
        let spotLightNode = SCNNode()
        spotLightNode.position = SCNVector3Make(0, 50, 0)
        spotLightNode.rotation = SCNVector4Make(1, 0, 0, -.pi/2)
        spotLightNode.light?.color = UIColor.red
        spotLightNode.light?.type = .spot
        myView.scene?.rootNode.addChildNode(spotLightNode)
        
        // 添加球体
    }

}
