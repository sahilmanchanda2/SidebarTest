//
//  extensions.swift
//  Sidemenu
//
//  Created by Admin on 04/11/18.
//  Copyright © 2018 PanthersTechnik. All rights reserved.
//

import Foundation
import UIKit
extension UIStoryboard{
    struct main {
        static func LaunchVC() -> ViewController?{
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        }
        static func NavigationVC() -> NavigationViewController?{
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationViewController") as? NavigationViewController
        }
        static func SecondVC() -> SecondViewController?{
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        }
        static func ThirdVC() -> ThirdViewController?{
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController
        }
        
    }
}
