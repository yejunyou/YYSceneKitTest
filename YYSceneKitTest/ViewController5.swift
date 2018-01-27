//
//  ViewController5.swift
//  YYSceneKitTest
//
//  Created by yejunyou on 2018/1/24.
//  Copyright © 2018年 yejunyou. All rights reserved.
//

import UIKit
import SceneKit

class ViewController5: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建场景
        let scnView = SCNView.init(frame: view.bounds)
        scnView.backgroundColor = UIColor.black
        scnView.scene = SCNScene()
        scnView.allowsCameraControl = true
        view.addSubview(scnView)
        
        // 添加相机
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.position = SCNVector3Make(0, 0, 50)
        cameraNode.camera = camera
        scnView.scene?.rootNode.addChildNode(cameraNode)
        
        let box = SCNBox.init(width: 10, height: 10, length: 10, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = UIImage.init(named: "123")
        let boxNode = SCNNode()
        boxNode.position = SCNVector3Make(0, 0, 0)
        boxNode.geometry = box
        scnView.scene?.rootNode.addChildNode(boxNode)
        
        // 添加动画行为
        let rotation = SCNAction.rotate(by: 5, around: SCNVector3Make(0, 1, 0), duration: 2)
        let moveUp = SCNAction.move(to: SCNVector3Make(0, 15, 0), duration: 1)
        let moveDown = SCNAction.move(to: SCNVector3Make(0, -15, 0), duration: 1)
        
        // 顺序执行的动画
        let sequence = SCNAction.sequence([moveUp, moveDown])
        
        // 组合执行的动画
        let group = SCNAction.group([sequence, rotation])
        
        // 运行动画
//        boxNode.runAction(group) 这个方法只会执行一次
//         boxNode.runAction(SCNAction.repeat(<#T##action: SCNAction##SCNAction#>, count: <#T##Int#>)) 指定动画执行次数
        boxNode.runAction(SCNAction.repeatForever(group)) // 永远执行
    }
}
