//
//  BViewController.swift
//  10.03.26_(ViewCtrollerDataTransfer)
//
//  Created by Solji Kim on 27/03/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    
    let bLabel = UILabel()
    let bButton = UIButton(type: .system)
    var bNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        bLabel.frame = CGRect(x: 50, y: 100, width: 250, height: 80)
        bLabel.text = "\(bNum)"
        bLabel.textColor = .red
        view.addSubview(bLabel)
        
        let dismissButton = UIButton(type: .system)
        dismissButton.frame = CGRect(x: 150, y: 500, width: 120, height: 40)
        dismissButton.setTitleColor(.red, for: .normal)
        dismissButton.setTitle("Close current tab", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissBVC), for: .touchUpInside)
        view.addSubview(dismissButton)
    }
    
    @objc func dismissBVC() {
        
        guard let avc = presentingViewController as? ViewController else{
            return
        }
        
        avc.aNum = bNum + 1
        
        presentingViewController?.dismiss(animated: true)
    }

}
