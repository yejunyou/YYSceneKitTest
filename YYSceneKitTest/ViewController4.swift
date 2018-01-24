//
//  ViewController4.swift
//  YYSceneKitTest
//
//  Created by yejunyou on 2018/1/24.
//  Copyright © 2018年 yejunyou. All rights reserved.
//

import UIKit
import SceneKit

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        // 场景视图
        let scnView = SCNView.init(frame: view.bounds)
        scnView.backgroundColor = UIColor.black
        scnView.allowsCameraControl = true
        view.addSubview(scnView)
        scnView.scene = SCNScene()
        
        // 添加照相机
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3Make(0, 0, 50)
        scnView.scene?.rootNode.addChildNode(cameraNode)
        
        // 调节视角
//        camera.xFov = 20  废弃了，改用 focalLength
//        camera.yFov = 20  focalLength
        camera.focalLength = 20
        camera.fieldOfView = 20
        
        // 设置正投影
//        camera.usesOrthographicProjection = true // 不论远近，大小看起来都一样
//        camera.orthographicScale = 100
//        // 调节比例
//        camera.apertureBladeCount = 10000
        
        // 盒子1
        let box1 = SCNBox.init(width: 10, height: 10, length: 10, chamferRadius: 0)
        box1.firstMaterial?.diffuse.contents = UIImage.init(named: "bw")
        let boxNode1 = SCNNode()
        boxNode1.geometry = box1
        scnView.scene?.rootNode.addChildNode(boxNode1)
        
        // 盒子2
        let box2 = SCNBox.init(width: 10, height: 10, length: 10, chamferRadius: 0)
        box2.firstMaterial?.diffuse.contents = UIImage.init(named: "bw")
        let boxNode2 = SCNNode()
        boxNode2.geometry = box2
        boxNode2.position = SCNVector3Make(0, 10, -20)
        scnView.scene?.rootNode.addChildNode(boxNode2)
        
        // todoyy: 如何给六面体设置不同的iamge？
    }
}
