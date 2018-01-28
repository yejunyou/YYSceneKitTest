//
//  ViewController3.swift
//  YYSceneKitTest
//
//  Created by yejunyou on 2018/1/24.
//  Copyright © 2018年 yejunyou. All rights reserved.
//

import UIKit
import SceneKit

class ViewController3: UIViewController {

    var gameView: SCNView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSCNView()
        addBoxNode()
        addLightNode()
    }
    
    private func setupSCNView(){
        gameView = SCNView.init(frame: view.bounds)
        gameView.allowsCameraControl = true
        gameView.backgroundColor = UIColor.black
        gameView.scene = SCNScene()
        view.addSubview(gameView)
    }
    
    private func addBoxNode() {
        // 正方块
        let box = SCNBox.init(width: 0.5, height: 0.5, length: 0.5, chamferRadius: 0.1)
//        box.firstMaterial?.diffuse.contents = UIColor.red
        
        // 球体
        let sphere = SCNSphere.init(radius: 0.1)
//        sphere.firstMaterial?.diffuse.contents = UIColor.green
        
        // 把两个结合体绑定到节点上
        let boxNode = SCNNode()
        boxNode.geometry = box
        boxNode.position = SCNVector3Make(0, 0, -11)
        
        let sphereNode = SCNNode()
        sphereNode.geometry = sphere
        sphereNode.position = SCNVector3Make(0, 0, -10)
        
        // 把节点添加到场景中
        gameView.scene?.rootNode.addChildNode(boxNode)
        gameView.scene?.rootNode.addChildNode(sphereNode)
    }
    
    
    private func addLightNode() {
        let light = SCNLight()
        light.type = .spot
        light.color = UIColor.blue
        light.castsShadow = true // 捕捉阴影
        light.spotOuterAngle = 2 // 默认45°
//        light.spotInnerAngle = -2
        
        light.zFar = 10 // 设置它最远能照射单位10 的地方,也就是说只能照到 球体的位置
        let lightNode = SCNNode()
        lightNode.position = SCNVector3Make(0, 0, 0)  // 设置光源节点的位置
        lightNode.light = light
        gameView.scene?.rootNode.addChildNode(lightNode)
        
    }
}
