//
//  ViewController.swift
//  Example
//
//  Created by twStephen on 2020/2/12.
//  Copyright © 2020 twStephen. All rights reserved.
//

import UIKit
import Aletheia

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        handleString()
        handleURL()
        handleDate()
    }
}

class ssss {
    
}
 
extension ViewController {
    
    private func handleString() -> Void {
        let aNumber = "666666666"
        print(aNumber.al.toInt)
        
        let aDate = "2019-02-13"
        print(aDate.al.toDateStringFormat("yyyy", oldFormat: "yyyy-MM-dd"))
        
        let aURL = "https://www.example.com"
        print(aURL.al.toURL())
    }
    
    private func handleURL() -> Void {
        let sample = URL(string: "https://www.example.com")
        "https://www.example.com".al.toURL()
        
        let aURL = sample?.al.doAppendComponent("key1", value: "value1")
    }
    
    private func handleDate() -> Void {
        let date = Date().al.toString()
        print(date)
    }
    
    private func handleScreen() -> Void {
        ALScreen.width
        ALScreen.height
    }
    
    private func handleSystem() -> Void {
        ALSystems.getVersion
        ALSystems.getAppBundleID
    }
    
}

