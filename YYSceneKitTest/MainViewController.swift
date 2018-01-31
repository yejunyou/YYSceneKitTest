//
//  MainViewController.swift
//  YYSceneKitTest
//
//  Created by yejunyou on 2018/1/24.
//  Copyright © 2018年 yejunyou. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    let dataList = ["0.ARWorldTrackingConfiguration+虚拟物体展示",
                    "1.加载本地.DAE展示虚拟物体",
                    "2.SCNText展示3D文字",
                    "3.SCNLight光与影",
                    "4.SCNBox展示六面体盒子",
                    "5.SCNAction动画群组",
                    "6.SCNGeometry展示多种形状",
                    "7.SCNLight渲染地球场景光",
                    "8.SCNPhysicsBody模拟物体作用力",
                    "9.SCNParticleSystem粒子系统模拟火、雨、星、雪...",
                    "10.SCNPhysicsHingeJoint节点"
                    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorColor = UIColor.clear
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identify:String = "reuseIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identify)
        if cell == nil
        {
            cell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier: identify)
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            cell?.selectionStyle = .none
        }
        cell?.textLabel?.text = dataList[indexPath.row]
        return cell!
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcName:String?
        switch indexPath.row {
            case 0:vcName = "ViewController"
            case 1:vcName = "ViewController1"
            case 2:vcName = "ViewController2"
            case 3:vcName = "ViewController3"
            case 4:vcName = "ViewController4"
            case 5:vcName = "ViewController5"
            case 6:vcName = "ViewController6"
            case 7:vcName = "ViewController7"
            case 8:vcName = "ViewController8"
            case 9:vcName = "ViewController9"
            case 10:vcName = "ViewController10"
            case 11:vcName = "ViewController11"
            case 12:vcName = "ViewController12"
            case 13:vcName = "ViewController13"
            default:vcName = "ViewController"
        }
        
        /*
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: vcName!)
        vc.title = dataList[indexPath.row]
        self.navigationController!.pushViewController(vc, animated: true)
        */
        
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"]
        guard let ns = nameSpace as? String else{
            return
        }
        let vcClass: AnyClass? = NSClassFromString(ns + "." + vcName!)
        guard let myClassType = vcClass as? UIViewController.Type else{
            return
        }
        
        let vc = myClassType.init()
        vc.title = dataList[indexPath.row]
        self.navigationController!.pushViewController(vc, animated: true)
    }

}
