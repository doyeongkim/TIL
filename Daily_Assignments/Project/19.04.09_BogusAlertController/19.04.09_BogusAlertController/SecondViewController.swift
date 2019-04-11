//
//  SecondViewController.swift
//  19.04.09_BogusAlertController
//
//  Created by Solji Kim on 10/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func colorButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            guard let yellow = presentingViewController as? ViewController else { return }
            yellow.view.backgroundColor = .yellow
        case 1:
            guard let white = presentingViewController as? ViewController else { return }
            white.view.backgroundColor = .white
        default:
            break
        }
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        guard let firstVC = presentingViewController as? ViewController else { return }
        presentingViewController?.dismiss(animated: true)
    }
}
