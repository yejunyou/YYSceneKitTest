//
//  ViewController9.swift
//  YYSceneKitTest
//
//  Created by 叶俊有 on 2018/1/28.
//  Copyright © 2018年 yejunyou. All rights reserved.
//  粒子系统

import UIKit
import SceneKit

class ViewController9: UIViewController {

    var myView:SCNView!
    var boxNode:SCNNode!
    var cameraNode:SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSceneView()
        addCamera()
        addCube()
        addFire()
    }
    // 添加场景视图
    private func addSceneView(){
        myView = SCNView.init(frame: view.bounds, options: [SCNView.Option.preferLowPowerDevice.rawValue:true]) // 低功耗渲染
        myView.allowsCameraControl = true
        myView.showsStatistics = true
        myView.backgroundColor = UIColor.black
        myView.preferredFramesPerSecond = 30
        
        
        myView.scene = SCNScene()
        view.addSubview(myView)
    }
    
    // 添加相机
    private func addCamera(){
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 50)
        cameraNode.camera?.automaticallyAdjustsZRange = true
        myView.scene?.rootNode.addChildNode(cameraNode)
    }
    
    // 正方体
    private func addCube(){
        let box = SCNBox.init(width: 10, height: 10, length: 10, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = "1"
        
        boxNode = SCNNode.init(geometry: box)
        boxNode.position = SCNVector3Make(0, 10, -100)
        myView.scene?.rootNode.addChildNode(boxNode)
        
        // 动画
    }
    
    // 添加火粒子系统
    private func addFire(){
        let particleSystem = SCNParticleSystem.init(named: "Fire.scnp", inDirectory: nil)
//        particleSystem?.particleVelocity = 100
//        particleSystem?.particleSize = 11
//        particleSystem?.birthDirection =
        // TIPS:有些属性可以直接在 Fire.scnp 里设置，比如这里的粒子团的形状，大小，方向模式等
        
        let node = SCNNode()
        node.position = SCNVector3Make(0, -1, 0)
        node.addParticleSystem(particleSystem!)
        boxNode.addChildNode(node)
        
        let rotation = SCNAction.repeatForever(SCNAction.move(by: SCNVector3Make(0, 0, 10), duration: 1))
        boxNode.runAction(rotation)
        
        cameraNode.constraints = [SCNLookAtConstraint.init(target: boxNode)]
    }
}
