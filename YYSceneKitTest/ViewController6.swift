//
//  ViewController6.swift
//  YYSceneKitTest
//
//  Created by yejunyou on 2018/1/24.
//  Copyright © 2018年 yejunyou. All rights reserved.
//

import UIKit
import SceneKit

class ViewController6: UIViewController {

    var mySceneView: SCNView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 场景视图
        let sceneView = SCNView.init(frame: view.bounds)
        sceneView.backgroundColor = UIColor.black
        sceneView.allowsCameraControl = true
        sceneView.scene = SCNScene()
        view.addSubview(sceneView)
        mySceneView = sceneView
        
        // 0.创造相机
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 8)
        sceneView.scene?.rootNode.addChildNode(cameraNode)
        
        // 1.平面
        let plane = SCNPlane.init(width: 8, height: 8)
        createGeometryNode(plane, SCNVector3Make(0, 0, -0.5),img:"IMG_2665")
        
        // 2.正方体
        let box = SCNBox.init(width: 1, height: 1, length: 1, chamferRadius: 0)
        createGeometryNode(box, SCNVector3Make(-4, 0, 0),img:"1")
        
        // 3.金字塔
        let pyramid = SCNPyramid.init(width: 1, height: 1, length: 1)
        createGeometryNode(pyramid, SCNVector3Make(-3, 0, 0), img: "2")
        
        // 4.球体
        let sphere = SCNSphere.init(radius: 1)
        createGeometryNode(sphere, SCNVector3Make(-2, 0, 0), img: "1")
        
        // 5.圆柱体
        let cylinder = SCNCylinder.init(radius: 0.5, height: 3)
        createGeometryNode(cylinder, SCNVector3Make(0, 0, 0), img: "1")
        
        // 6.圆锥
        let cone = SCNCone.init(topRadius: 0, bottomRadius: 0.5, height: 2)
        createGeometryNode(cone, SCNVector3Make(1, 0, 0), img: "1")
        
        // 7.管道
        let tube = SCNTube.init(innerRadius: 0.3, outerRadius: 1, height: 4)
        createGeometryNode(tube, SCNVector3Make(2, 0, 0), img: "1")
        
        // 8.胶囊
        let capsule = SCNCapsule.init(capRadius: 0.5, height: 3)
        createGeometryNode(capsule, SCNVector3Make(3, 0, 0), img: "1")
        
        // 9.环面
        let torus = SCNTorus.init(ringRadius: 1, pipeRadius: 0.5)
        createGeometryNode(torus, SCNVector3Make(4, 0, 0), img: "1")
        
        // 10.地板
        let floor = SCNFloor.init()
        createGeometryNode(floor, SCNVector3Make(0, -0.5, 0), img: "1")
        
        // 11.文字
        let text = SCNText.init(string: "庄子游天下", extrusionDepth: 0.3)
        createGeometryNode(text, SCNVector3Make(-4, 0.5, 0), img: "1")
        
        // 设置文字被包裹
        text.isWrapped = true
        text.containerFrame = CGRect(x:0,y:0,width:10,height:5)
        text.font = UIFont.systemFont(ofSize: 1)
        text.alignmentMode = kCAAlignmentCenter
        
        // 文字倾斜角度
        text.chamferProfile = UIBezierPath.init(arcCenter: CGPoint(x:0,y: 0), radius: 0.1, startAngle: 0, endAngle: .pi, clockwise: true)
        text.chamferRadius = 0.1
        text.flatness = 3
        createGeometryNode(text, SCNVector3Make(-2, 0, 0), img: "")
        
        // 绘制任意形状
        let shape = SCNShape.init(path: UIBezierPath.init(roundedRect: CGRect(x:0,y:0,width:1,height:1), cornerRadius: 0.5), extrusionDepth: 3)
        createGeometryNode(shape, SCNVector3Make(0, 0, 0), img: "1")
    }
    
    private func createGeometryNode(_ geo:SCNGeometry,_ position:SCNVector3,img imageName:String){
        geo.firstMaterial?.diffuse.contents = UIImage.init(named: imageName)
        let node = SCNNode.init(geometry: geo)
        node.position = position
        mySceneView?.scene?.rootNode.addChildNode(node)
    }
}
