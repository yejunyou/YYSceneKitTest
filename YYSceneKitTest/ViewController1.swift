//
//  ViewController1.swift
//  YYSceneKitTest
//
//  Created by yejunyou on 2018/1/24.
//  Copyright © 2018年 yejunyou. All rights reserved.
//

import UIKit
import SceneKit

class ViewController1: UIViewController {

    @IBOutlet weak var myView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 【yizi.DAE】被我搞坏啦==|
        let scene = SCNScene(named: "art.scnassets/yizi2.DAE")!
        
        // Set the scene to the view
        myView.scene = scene
        myView.allowsCameraControl = true
        myView.backgroundColor = UIColor.black
    }
}
