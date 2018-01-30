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
//        myView = SCNView.init(frame: view.bounds, options: [SCNView.Option.preferLowPowerDevice.rawValue:true]) // 低功耗渲染
//        myView.preferredFramesPerSecond = 30
        myView = SCNView.init(frame: view.bounds)
        myView.allowsCameraControl = true
        myView.showsStatistics = true
        myView.backgroundColor = UIColor.black
        
        
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
//        boxNode.position = SCNVector3Make(0, 10, -100)
        myView.scene?.rootNode.addChildNode(boxNode)
        
        // 动画
    }
    
    // 添加火粒子系统
    private func addFire(){
//        let particleSystem = SCNParticleSystem.init(named: "Bokeh.scnp", inDirectory: nil) // 金色小点
//        let particleSystem = SCNParticleSystem.init(named: "Confetti.scnp", inDirectory: nil) // 庆贺彩纸
//        let particleSystem = SCNParticleSystem.init(named: "Reactor.scnp", inDirectory: nil) // 反应堆
//        let particleSystem = SCNParticleSystem.init(named: "Smoke.scnp", inDirectory: nil) // 冒烟 属性需要对应设置好、仿真度才高
//        let particleSystem = SCNParticleSystem.init(named: "Stars.scnp", inDirectory: nil) // 小星星
//        let particleSystem = SCNParticleSystem.init(named: "Rain.scnp", inDirectory: nil) // 下雨 效果像花洒
        let particleSystem = SCNParticleSystem.init(named: "Fire.scnp", inDirectory: nil)

        
        // TIPS:有些属性可以直接在 .scnp 里设置，比如这里的粒子团的形状，大小，方向模式等
//        particleSystem?.particleVelocity = 100
//        particleSystem?.particleSize = 11
//        particleSystem?.birthDirection =
        particleSystem?.birthRate = 100
//        particleSystem?.emittingDirection =
//        particleSystem?.particleSize = 0.01
        particleSystem?.emitterShape = SCNBox.init(width: 10, height: 10, length: 10, chamferRadius: 0)
        
        let node = SCNNode()
        node.position = SCNVector3Make(0, -1, 0)
        node.addParticleSystem(particleSystem!)
        boxNode.addChildNode(node)
        
        // 上升动画
//        let rotation = SCNAction.repeatForever(SCNAction.move(by: SCNVector3Make(0, 0, 10), duration: 1))
//        boxNode.runAction(rotation)
        
        
        // 添加动画行为
        let rotation = SCNAction.rotate(by: 5, around: SCNVector3Make(0, 1, 0), duration: 12)
        let moveUp = SCNAction.move(to: SCNVector3Make(0, 15, 0), duration: 6)
        let moveDown = SCNAction.move(to: SCNVector3Make(0, -15, 0), duration: 6)
        // 顺序执行的动画
        let sequence = SCNAction.sequence([moveUp, moveDown])
        // 组合执行的动画
        let group = SCNAction.group([sequence, rotation])
        boxNode.runAction(SCNAction.repeatForever(group)) // 永远执行
        
//        cameraNode.constraints = [SCNLookAtConstraint.init(target: boxNode)]
    }
}
