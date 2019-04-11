//
//  SecondViewController.swift
//  19.04.04_(UISlider)
//
//  Created by Solji Kim on 06/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let dismissButton = UIButton()
        dismissButton.frame = CGRect(x: view.frame.width / 2 - 50, y: view.frame.maxY - 100, width: 100, height: 40)
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.backgroundColor = .gray
        dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        view.addSubview(dismissButton)
        
        view.backgroundColor = .init(red: CGFloat(Colors.shared.red), green: CGFloat(Colors.shared.green) , blue: CGFloat(Colors.shared.blue), alpha: 1)
        
    }
    
    @objc func dismissVC() {
        guard let dismissSecondVC = presentingViewController as? ViewController else { return }
        presentingViewController?.dismiss(animated: true)
    }
    

    
}
