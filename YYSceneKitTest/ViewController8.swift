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
        createStaticBox()
        createDynamicBox()
//        createKinematicBox()
    }

    // 添加场景视图
    private func addSceneView(){
        myView = SCNView.init(frame: view.bounds, options: [SCNView.Option.preferLowPowerDevice.rawValue:true]) // 低功耗渲染
        myView.allowsCameraControl = true
        myView.showsStatistics = true
        myView.backgroundColor = UIColor.black
        
        myView.scene = SCNScene()
        myView.scene?.physicsWorld.speed = 9.8 // 加速度
        myView.preferredFramesPerSecond = 60
        
        view.addSubview(myView)
    }
    
    // 添加相机
    private func addCamera(){
        let cameraNode = SCNNode()
        cameraNode.position = SCNVector3Make(0,10, 20)
        cameraNode.rotation = SCNVector4Make(1, 0, 0, -.pi/8) // 调整视角
        cameraNode.camera = SCNCamera()
        cameraNode.camera?.automaticallyAdjustsZRange = true
        myView.scene?.rootNode.addChildNode(cameraNode)
    }
    
    // 添加地板
    private func addFloor(){
        let floor = SCNFloor.init()
        floor.firstMaterial?.diffuse.contents = UIImage.init(named: "floor.jpg")
        let floorNode = SCNNode.init(geometry: floor)
        floorNode.position = SCNVector3Make(0, -1, 0)
        floorNode.physicsBody = SCNPhysicsBody.static() // 静态
        myView.scene?.rootNode.addChildNode(floorNode)
    }
    
    /*
     static： 创建一个不受力量或碰撞影响而不能移动的物理体。
             使用静态物体来构建场景中的其他物体需要碰撞但不会移动的固定装置，例如地板，墙壁和地形
     
     dynamic：创建一个可受力量和碰撞影响的物理体。
              使用物理模拟移动的场景元素的动态物体。
     
     kinematic：创建一个不受力或碰撞影响的物理体，但移动时可能会导致影响其他物体的碰撞。
                使用运动物体来直接控制场景元素，但其运动操纵其他元素。
                例如，要允许用户用手指推动物体，可以创建一个运动物体并将其附加到一个不可见的节点上，这个节点将移动跟随事件。
                （在macOS中，使用相同的技术来允许用户使用鼠标指针移动对象。）
     */
    
    // 添加静态body : 外力对它们不起作用
    private func createStaticBox(){
        for _ in 0..<10
        {
            let box = SCNBox.init(width: 0.5, height: 3, length: 1, chamferRadius: 0)
            box.firstMaterial?.diffuse.contents = "1"
            let boxNode = SCNNode.init(geometry: box)
            boxNode.physicsBody = SCNPhysicsBody.dynamic() // 静态 yytodo：（调试时注意修改）
            boxNode.position = SCNVector3Make(Float(arc4random_uniform(5)), 0, Float(arc4random_uniform(5)))
            myView.scene?.rootNode.addChildNode(boxNode)
        }
    }
    
    // 动态body：外力对他们起作用
    private func createDynamicBox(){
        for _ in 0...5
        {
            let pherre = SCNSphere.init(radius: 1)
            pherre.firstMaterial?.diffuse.contents = "sun"
            let sphereNode = SCNNode.init(geometry: pherre)
            sphereNode.physicsBody = SCNPhysicsBody.dynamic() // 动态
            sphereNode.position = SCNVector3Make(Float(arc4random_uniform(5)), 10, Float(arc4random_uniform(5)))
            
            let move = SCNAction.move(to: SCNVector3Make(sphereNode.position.x, 0, sphereNode.position.z), duration: 5)
            sphereNode.runAction(move)
            myView.scene?.rootNode.addChildNode(sphereNode)
        }
    }
    
    // 运动body：
    private func createKinematicBox(){
        for _ in 0..<5
        {
            let pherre = SCNSphere.init(radius: 1)
            pherre.firstMaterial?.diffuse.contents = "sun"
            let sphereNode = SCNNode.init(geometry: pherre)
            sphereNode.physicsBody = SCNPhysicsBody.kinematic() // 运动态
            sphereNode.position = SCNVector3Make(Float(arc4random_uniform(5)), 10, Float(arc4random_uniform(5)))
            
            let move = SCNAction.move(to: SCNVector3Make(sphereNode.position.x, 0, sphereNode.position.z), duration: 5)
            sphereNode.runAction(move)
            myView.scene?.rootNode.addChildNode(sphereNode)
        }
    }
    
}
