//
//  SecondViewController.swift
//  Sidemenu
//
//  Created by Admin on 04/11/18.
//  Copyright © 2018 PanthersTechnik. All rights reserved.
//

import Foundation
import UIKit
class SecondViewController: UIViewController{
    
    @IBAction func OpenMenu(_ sender: Any) {
          SidebarLauncher(delegate: self ).show()
    }
}
extension SecondViewController: SidebarDelegate{
    func sidbarDidOpen() {
        print("Sidebar opened")
    }
    
    func sidebarDidClose(with item: Int?) {
        guard let item = item else {return}
        print("Did select \(item)")
        switch item {
        case 0:
            let v = UIStoryboard.main.LaunchVC()
            present(v!, animated: true)
        case 1:
           break
        case 2:
            let v = UIStoryboard.main.ThirdVC()
            present(v!, animated: true)
        default:
            break
        }
    }
}

