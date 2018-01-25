//
//  MainViewController.swift
//  YYSceneKitTest
//
//  Created by yejunyou on 2018/1/24.
//  Copyright © 2018年 yejunyou. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    let dataList = ["灰机✈️", "加载Dea-椅子", "3D文字", "光与影", "相机视角","动画群组","base geometry type"]
    override func viewDidLoad() {
        super.viewDidLoad()

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
        }
        cell?.textLabel?.text = dataList[indexPath.row]
        return cell!
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcName:String?
        switch indexPath.row {
            case 0:vcName = "ViewController"
            case 1:vcName = "ViewController01"
            case 2:vcName = "ViewController2"
            case 3:vcName = "ViewController3"
            case 4:vcName = "ViewController4"
            case 5:vcName = "ViewController5"
            case 6:vcName = "ViewController6"
            default:vcName = "ViewController"
        }
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: vcName!)
        vc.title = dataList[indexPath.row]
        self.navigationController!.pushViewController(vc, animated: true)
    }

}
