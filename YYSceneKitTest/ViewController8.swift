//
//  ViewController8.swift
//  YYSceneKitTest
//
//  Created by yejunyou on 2018/1/28.
//  Copyright © 2018年 yejunyou. All rights reserved.
//

import UIKit
import SceneKit

class ViewController8: UIViewController {
    
    var myView:SCNView!
    override func viewDidLoad() {
        super.viewDidLoad()

        addSceneView()
        addCamera()
        addFloor()
    }

    // 添加场景视图
    private func addSceneView(){
        myView = SCNView.init(frame: view.bounds)
        myView.allowsCameraControl = true
        myView.showsStatistics = true
        myView.backgroundColor = UIColor.black
        
        myView.scene = SCNScene()
        myView.scene?.physicsWorld.speed = 9.8 // 加速度
        
        view.addSubview(myView)
    }
    
    // 添加相机
    private func addCamera(){
        let camera = SCNCamera()
        camera.automaticallyAdjustsZRange = true
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3Make(0, 10, 20)
        cameraNode.rotation = SCNVector4Make(1, 0, 0, -.pi/8.0) // 调整视角
        myView.scene?.rootNode.addChildNode(cameraNode)
    }
    
    // 添加地板
    private func addFloor(){
        let floor = SCNPlane.init(width: 20, height: 20)
        floor.firstMaterial?.diffuse.contents = "floor.jpg"
        let floorNode = SCNNode.init(geometry: floor)
        floorNode.physicsBody = SCNPhysicsBody.static() // 静态
        myView.scene?.rootNode.addChildNode(floorNode)
    }
}
