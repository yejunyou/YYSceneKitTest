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

    var myView:SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSceneView()
        addCamera()
        addLight()
        addBoxAndSphere()// 添加正方体和球体
    }
    
    // 添加场景视图
    private func addSceneView(){
        myView = SCNView.init(frame: view.bounds)
        myView.allowsCameraControl = true
        myView.backgroundColor = UIColor.black
        myView.scene = SCNScene()
        view.addSubview(myView)
    }
    
    // 添加相机
    private func addCamera(){
        let camera = SCNCamera()
        camera.automaticallyAdjustsZRange = true
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3Make(0, 0, 10)
        myView.scene?.rootNode.addChildNode(cameraNode)
    }
    
    
    /*
     public static let ambient      : SCNLight.LightType
     public static let omni         : SCNLight.LightType // Omnidirectional light
     public static let directional  : SCNLight.LightType // Directional light
     public static let spot         : SCNLight.LightType // Spot light
     public static let IES          : SCNLight.LightType // IES light
     public static let probe        : SCNLight.LightType // Light probe
     */
    func addLight()  {
        // 添加环境光:directional 平行光 只有照射方向、位置、不会衰减
//        let lightNode = SCNNode()
//        lightNode.light = SCNLight()
//        lightNode.light?.type = .directional
//        lightNode.light?.color = UIColor.white //  给其他颜色，效果不一样
//        myView.scene?.rootNode.addChildNode(lightNode)
        
        // 添加环境光:omni 有固定位置、360度散射、会衰减
        let lightNode = SCNNode()
        lightNode.position = SCNVector3Make(100, 0, 100)
        lightNode.light = SCNLight()
        lightNode.rotation = SCNVector4Make(1, 0, 0, -.pi/2)
        lightNode.light?.color = UIColor.white
        lightNode.light?.type = .omni
        myView.scene?.rootNode.addChildNode(lightNode)
        
        // 添加环境光:ambient 无穷远、没方向、360度照射、均匀散射到物体上
        // 效果：通透的亮
//        let lightNode = SCNNode()
//        lightNode.position = SCNVector3Make(0, 0, -100)
//        lightNode.light = SCNLight()
//        lightNode.light?.color = UIColor.white
//        lightNode.light?.type = .ambient
//        myView.scene?.rootNode.addChildNode(lightNode)
        
        // 添加环境光:spot 点光源、有方向、位置、照射区域、会衰减
//        let lightNode = SCNNode()
//        lightNode.position = SCNVector3Make(0, 0, 100)
//        lightNode.light = SCNLight()
//        lightNode.light?.color = UIColor.white
//        lightNode.light?.type = .spot
//        myView.scene?.rootNode.addChildNode(lightNode)
        
        // 添加环境光:IES 光源的形状，方向和强度由光度分布决定
//        let lightNode = SCNNode()
//        lightNode.position = SCNVector3Make(0, 0, 10)
//        lightNode.light = SCNLight()
//        lightNode.light?.color = UIColor.white
//        lightNode.light?.type = .IES
//        myView.scene?.rootNode.addChildNode(lightNode)
        
        // 添加环境光:probe 场景中某个点周围的环境样本，用于基于环境的照明
//        let lightNode = SCNNode()
//        lightNode.position = SCNVector3Make(0, 0, 100)
//        lightNode.light = SCNLight()
//        lightNode.light?.color = UIColor.white
//        lightNode.light?.type = .probe
//        myView.scene?.rootNode.addChildNode(lightNode)
    }
    
    private func addBoxAndSphere(){
        let sphere = SCNSphere.init(radius: 2)
        sphere.firstMaterial?.locksAmbientWithDiffuse = true
        sphere.firstMaterial?.diffuse.contents = "earth-diffuse.jpg"//UIImage.init(named: "earth-diffuse.jpg")
        sphere.firstMaterial?.ambient.contents = "earth-bump.png"//UIImage.init(named: "earth-bump.png")
        let sphereNode = SCNNode.init(geometry: sphere)
        let rotation = SCNAction.rotate(by: 5, around: SCNVector3Make(0, 1, 0), duration: 8)
        sphereNode.runAction(SCNAction.repeatForever(rotation))
        myView.scene?.rootNode.addChildNode(sphereNode)
    }
}
