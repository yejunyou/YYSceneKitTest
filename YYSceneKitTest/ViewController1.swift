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
        
        let path = Bundle.path(forResource: "yizi", ofType: "DAE", inDirectory: "/Users/yejunyou/Desktop/YYSceneKitTest/YYSceneKitTest/art.scnassets")
        let url = URL.init(fileURLWithPath: path!)
        
        do{
            let scene = try SCNScene.init(url: url, options: nil)
            myView.allowsCameraControl = true
            myView.scene = scene
        }catch{
            print("error")
        }
    }
}
