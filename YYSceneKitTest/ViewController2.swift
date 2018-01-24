//
//  ViewController2.swift
//  YYSceneKitTest
//
//  Created by yejunyou on 2018/1/24.
//  Copyright © 2018年 yejunyou. All rights reserved.
//

import UIKit
import SceneKit

class ViewController2: UIViewController {

    @IBOutlet weak var gameView: SCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSCNView()
        createScene()
    }
    
    private func addSCNView(){
        let scnview = SCNView.init(frame: CGRect(x: 0,y: 0,width: 300,height: 300))
        scnview.center  = CGPoint(x: view.bounds.width/2,y: view.bounds.height / 2)
        scnview.backgroundColor = UIColor.black
        scnview.allowsCameraControl = true
        view.addSubview(scnview)
        gameView = scnview
    }
    
    private func createScene(){
        let sphere = SCNSphere.init(radius: 0.5)
        let node = SCNNode()
        let scene = SCNScene()
        gameView.scene = scene
        
        scene.rootNode.addChildNode(node)
        node.geometry = sphere
        
        let childNode = SCNNode()
        childNode.position = SCNVector3Make(0, 0, 1)
        
        let text = SCNText.init(string: "成都带不走的只有你", extrusionDepth: 0.03)
        text.firstMaterial?.diffuse.contents = UIColor.yellow
        text.font = UIFont.systemFont(ofSize: 0.15)
        
        childNode.geometry = text
        node.addChildNode(childNode)
    }
}
