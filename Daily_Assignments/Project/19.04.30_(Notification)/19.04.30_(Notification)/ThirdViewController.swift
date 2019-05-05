//
//  ThirdViewController.swift
//  19.04.30_(Notification)
//
//  Created by Solji Kim on 05/05/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    let textLabel = UILabel()
    let notiCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.frame = CGRect(x: view.frame.width/2 - 150, y: 200, width: 300, height: 40)
        textLabel.textAlignment = .center
        view.addSubview(textLabel)
    }
    
    func addNotificationObserver() {
        notiCenter.addObserver(self, selector: #selector(didReceiveTextNotification(_:)), name: Notification.Name("TextNotification"), object: nil)
    }
    
    @objc func didReceiveTextNotification(_ sender: Notification) {
        guard let textField = sender.object as? UITextField else { return }
        textLabel.text = textField.text
    }
    

    

}
