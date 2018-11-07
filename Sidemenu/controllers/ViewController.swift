//
//  ViewController.swift
//  Sidemenu
//
//  Created by Admin on 04/11/18.
//  Copyright © 2018 PanthersTechnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func OpenMenu(_ sender: Any) {
        SidebarLauncher(delegate: self ).show()
    }
    
}
extension ViewController: SidebarDelegate{
    func sidbarDidOpen() {
        print("Sidebar opened")
    }
    
    func sidebarDidClose(with item: Int?) {
        guard let item = item else {return}
        print("Did select \(item)")
        switch item {
        case 0:
           break
        case 1:
            let v = UIStoryboard.main.SecondVC()
            present(v!, animated: true)
        case 2:
            let v = UIStoryboard.main.ThirdVC()
            present(v!, animated: true)
        default:
            break
        }
    }
}

