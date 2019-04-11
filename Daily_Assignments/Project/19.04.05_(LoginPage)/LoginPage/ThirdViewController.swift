//
//  ThirdViewController.swift
//  LoginPage
//
//  Created by Solji Kim on 06/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var newUserEmail = ""
    var newUserPw = ""
    
    @IBOutlet weak var userIdText: UITextField!
    @IBOutlet weak var userPwText: UITextField!
    
//    let alert2 = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        
        switch sender.tag {
        case 0:
            newUserEmail = sender.text ?? ""
        case 1:
            newUserPw = sender.text ?? ""
        default:
            break
        }
    }
}


extension ThirdViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

