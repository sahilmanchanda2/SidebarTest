//
//  SidebarLauncher.swift
//  Sidemenu
//
//  Created by Admin on 04/11/18.
//  Copyright © 2018 PanthersTechnik. All rights reserved.
//
import UIKit
protocol SidebarDelegate {
    func sidbarDidOpen()
    func sidebarDidClose(with item: Int?)
}
class SidebarLauncher: NSObject{
    
    var view: UIView?
    var delegate: SidebarDelegate?
    var vc: NavigationViewController?
    init(delegate: SidebarDelegate) {
        super.init()
        self.delegate = delegate
    }
    
    func show(){
        let bounds = UIScreen.main.bounds
        let v = UIView(frame: CGRect(x: -bounds.width, y: 0, width: bounds.width, height: bounds.height))
        v.backgroundColor = .clear
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationController") as! NavigationViewController
        v.addSubview(vc.view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vc.view.topAnchor.constraint(equalTo: v.topAnchor),
            vc.view.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            vc.view.bottomAnchor.constraint(equalTo: v.bottomAnchor),
            vc.view.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -60)
            ])
        vc.delegate = self
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:))))
        self.view = v
        self.vc = vc
        UIApplication.shared.keyWindow?.addSubview(v)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveEaseOut], animations: {
            self.view?.frame = CGRect(x: 0, y: 0, width: self.view!.frame.width, height: self.view!.frame.height)
            self.view?.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        }, completion: {completed in
            self.delegate?.sidbarDidOpen()
        })

    }
    
    @objc func handleTapGesture(_ sender: UITapGestureRecognizer){
        closeSidebar(option: nil)
    }
    func closeSidebar(option: Int?){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveEaseOut], animations: {
            if let view = self.view{
                view.frame = CGRect(x: -view.frame.width, y: 0, width: view.frame.width, height: view.frame.height)
                self.view?.backgroundColor = .clear
                
            }
        }, completion: {completed in
            self.view?.removeFromSuperview()
            self.view = nil
            self.vc = nil
            self.delegate?.sidebarDidClose(with: option)
        })
    }
    
}
extension SidebarLauncher: NavigationDelegate{
    func navigation(didSelect: Int?) {
        closeSidebar(option: didSelect)
    }
}
