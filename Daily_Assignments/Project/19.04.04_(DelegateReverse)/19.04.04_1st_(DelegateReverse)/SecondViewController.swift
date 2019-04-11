//
//  SecondViewController.swift
//  19.04.04_1st_(DelegateReverse)
//
//  Created by Solji Kim on 08/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

protocol DelegatePrepareMethod {
    func delegatePrepare(_ input: String)
}

class SecondViewController: UIViewController, DelegatePrepareMethod {
    
    var delegateInput = ""

    @IBOutlet weak var delegateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegateLabel.text = delegateInput
    }
    
    func delegatePrepare(_ input: String) {
        delegateInput = input
    }
    
}
