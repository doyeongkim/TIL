//
//  SecondViewController.swift
//  LoginPage
//
//  Created by Solji Kim on 05/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var emailLabel: String?
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = emailLabel
    }
    

    
}
