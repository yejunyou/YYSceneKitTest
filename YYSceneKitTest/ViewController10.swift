//
//  ViewController10.swift
//  YYSceneKitTest
//
//  Created by yejunyou on 2018/1/30.
//  Copyright © 2018年 yejunyou. All rights reserved.
//

import UIKit
import SceneKit

class ViewController10: UIViewController {
    
    var myView:SCNView!
    var boxNode:SCNNode!
    var cameraNode:SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSceneView()
        addCamera()
        addCube()
//        addFloor()
//
//        let text1 = addText(string: "庄")
//        let text2 = addText(string: "子")
//        let text3 = addText(string: "天")
//        let text4 = addText(string: "下")
        
        let text1 = addText(string: "什")
        let text2 = addText(string: "么")
        let text3 = addText(string: "鬼")
        let text4 = addText(string: "天")
        let text5 = addText(string: "气")
        let text6 = addText(string: "冷！")
        
        
        
        addHingeJoint(bodyA: boxNode!.physicsBody!, bodyB: text1.physicsBody!)
        addJoint(bodyA: text1.physicsBody!, bodyB: text2.physicsBody!)
        addJoint(bodyA: text2.physicsBody!, bodyB: text3.physicsBody!)
        addJoint(bodyA: text3.physicsBody!, bodyB: text4.physicsBody!)
        addJoint(bodyA: text4.physicsBody!, bodyB: text5.physicsBody!)
        addJoint(bodyA: text5.physicsBody!, bodyB: text6.physicsBody!)
    }
    
    // 添加场景视图
    private func addSceneView(){
        myView = SCNView.init(frame: view.bounds)
        myView.allowsCameraControl = true
//        myView.showsStatistics = true
        myView.backgroundColor = UIColor.black
        
        myView.scene = SCNScene()
        view.addSubview(myView)
    }
    
    // 添加相机
    private func addCamera(){
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 10, 13)
        cameraNode.camera?.automaticallyAdjustsZRange = true
        myView.scene?.rootNode.addChildNode(cameraNode)
    }
    
    // 正方体
    private func addCube(){
        let box = SCNBox.init(width: 1, height: 1, length: 1, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = "1"
        boxNode = SCNNode.init(geometry: box)
        boxNode.position = SCNVector3Make(0, 15, 0)
        boxNode.physicsBody = SCNPhysicsBody.static()
//        myView.scene?.rootNode.addChildNode(boxNode)
    }
    
    // 木板
    private func addFloor(){
        let floorNode = SCNNode.init(geometry: SCNFloor())
        floorNode.geometry?.firstMaterial?.diffuse.contents = "floor"
        floorNode.physicsBody = SCNPhysicsBody.static()
        myView.scene?.rootNode.addChildNode(floorNode)
    }
    
    // 文字+粒子效果
    private func addText(string text:String) -> SCNNode{
        let text = SCNText.init(string: text, extrusionDepth: 0.3)
        text.font = UIFont.systemFont(ofSize: 1)
        text.firstMaterial?.diffuse.contents = "sun"
        text.alignmentMode = kCAAlignmentCenter
        
        let node = SCNNode.init(geometry: text)
        node.position = SCNVector3Make(0, 4, 0)
        // 使用指定形状创建一个物理身体
        let shape = SCNPhysicsShape.init(geometry: SCNBox.init(width: 1, height: 1, length: 1, chamferRadius: 0), options: nil)
        node.physicsBody = SCNPhysicsBody.init(type: SCNPhysicsBodyType.dynamic, shape: shape)
        
        // 节点粒子系统
        let particleSystem = SCNParticleSystem.init(named: "Confetti.scnp", inDirectory: nil)
        particleSystem?.birthRate = 20
        let particleNode = SCNNode()
        particleNode.addParticleSystem(particleSystem!)
        particleNode.position = SCNVector3Make(0.5, 0, 0)
        node.addChildNode(particleNode)
        myView.scene?.rootNode.addChildNode(node)
        
        return node
    }
    
    /*
     类型：
     都是继承自 SCNPhysicsBehavior 这是一个抽象类，代表物理世界的某个行为
     SCNPhysicsHingeJoint       使两个身体像铰链连接一样移动。 例如适用于门，链条
     SCNPhysicsBallSocketJoint  使得两个物体像通过球窝关节连接一样移动（即，允许围绕所有轴旋转）
     SCNPhysicsSliderJoint      提供两个物体之间的线性滑动关节。
     SCNPhysicsConeTwistJoint   cone 圆锥体
     SCNPhysicsVehicleWheel     表示一个可以连接到SCNPhysicsVehicle实例的轮子
     SCNPhysicsVehicle          提供了一个车辆行为
     */
    
    // 添加 SCNPhysicsHingeJoint
    private func addHingeJoint(bodyA bodya:SCNPhysicsBody, bodyB bodyb:SCNPhysicsBody){
        let axisA = SCNVector3Make(1, 0, 0)
        let anchorA = SCNVector3Make(0, -0.5, 0)
        let axisB = SCNVector3Make(1, 0, 0)
        let anchorB = SCNVector3Make(0.5, 1, 0)
        
//        let frameA = SCNMatrix4MakeTranslation(1, 0, 0)
//        let frameB = SCNMatrix4MakeTranslation(0, 1, 0)
//        
//        let wheels1 = SCNPhysicsVehicleWheel.init(node: boxNode)
//        let wheels2 = SCNPhysicsVehicleWheel.init(node: boxNode)
        /* 【效果：1字悬挂】 */
        let joint = SCNPhysicsHingeJoint.init(bodyA: bodya, axisA: axisA, anchorA: anchorA, bodyB: bodyb, axisB: axisB, anchorB: anchorB)
        /* 【效果：围绕定点转圈】*/
//        let joint = SCNPhysicsBallSocketJoint.init(bodyA: bodya, anchorA: anchorA, bodyB: bodyb, anchorB: anchorB)
        /* 【效果：围绕定点摇摆，像摆钟那样】*/
//        let joint = SCNPhysicsSliderJoint.init(bodyA: bodya, axisA: axisA, anchorA: anchorA, bodyB: bodyb, axisB: axisB, anchorB: anchorB)
        /* 【效果：仿圆锥体形状旋转】*/
//        let joint = SCNPhysicsConeTwistJoint.init(bodyA: bodya, frameA: frameA, bodyB: bodyb, frameB: frameB)
        /* 【效果：变化着中心转圈】*/
//        let joint = SCNPhysicsVehicle.init(chassisBody: bodyb, wheels: [wheels1, wheels2])
        myView.scene?.physicsWorld.addBehavior(joint)
    }
    
    private func addJoint(bodyA bodya:SCNPhysicsBody, bodyB bodyb:SCNPhysicsBody){
        let axisA = SCNVector3Make(1, 0, 0)
        let anchorA = SCNVector3Make(0, -0.5, 0)
        let axisB = SCNVector3Make(1, 0, 0)
        let anchorB = SCNVector3Make(0, 0.5, 0)
        
        let jiont = SCNPhysicsHingeJoint.init(bodyA: bodya, axisA: axisA, anchorA: anchorA, bodyB: bodyb, axisB: axisB, anchorB: anchorB)
        
        myView.scene?.physicsWorld.addBehavior(jiont)
    }
    
    // 返回几何体
    private func createGeometryNode(_ geo:SCNGeometry,_ position:SCNVector3,img imageName:String){
        geo.firstMaterial?.diffuse.contents = UIImage.init(named: imageName)
        let node = SCNNode.init(geometry: geo)
        node.position = position
        myView?.scene?.rootNode.addChildNode(node)
    }
}
