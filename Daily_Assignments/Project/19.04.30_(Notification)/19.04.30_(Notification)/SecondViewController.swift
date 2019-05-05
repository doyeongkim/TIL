//
//  SecondViewController.swift
//  19.04.30_(Notification)
//
//  Created by Solji Kim on 05/05/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let colorView = UIView()
    let notiCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        view.addSubview(colorView)
        
        setAutoLayout()
    }
    
    func addNotificationObserver() {
        notiCenter.addObserver(self, selector: #selector(didReceiveColorNotification(_:)), name: Notification.Name("ColorNotification"), object: nil)
    }
    
    @objc func didReceiveColorNotification(_ sender: Notification) {
        
//        guard let mixedColor = sender.object as? UIColor else { return }
//        colorView.backgroundColor = mixedColor
        
        guard let mixedColor = sender.userInfo as? [String : UIColor] else { return }
        colorView.backgroundColor = mixedColor["colors"]
    }
    
    func setAutoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        colorView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 15).isActive = true
        colorView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -15).isActive = true
        colorView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -10).isActive = true
        
    }
    
}
