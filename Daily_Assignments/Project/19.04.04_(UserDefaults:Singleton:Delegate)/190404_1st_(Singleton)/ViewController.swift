//
//  ViewController.swift
//  190404_1st_(Singleton)
//
//  Created by Solji Kim on 04/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

/*
[ 과제 ]
 
 1. FirstVC 의 TextField 에 입력한 값을 SecondVC 의 Label에 표시하기
    - UserDefaults 를 이용한 방법으로 구현
    - Singleton 을 이용한 방법으로 구현
    - Delegate 를 이용한 방법으로 구현
*/


// singleton을 위한 클래스
class SingletonText {
    static let shared = SingletonText()
    var singletonInputText = ""
}

protocol DelegateText {
    func delegateInput() -> String
}

class ViewController: UIViewController, DelegateText {
    
    @IBOutlet weak var userDefaultsText: UITextField!
    @IBOutlet weak var singletonText: UITextField!
    @IBOutlet weak var delegateText: UITextField!
    
    var delegateInputText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let destination = segue.destination as? SecondViewController else { return }
        destination.delegate = self
        
    }
    
    
    @IBAction func editingChanged(_ sender: UITextField) {
        switch sender.tag {
            
        case 0:
            UserDefaults.standard.set(sender.text, forKey: "userDefaultsText")
        case 1:
            SingletonText.shared.singletonInputText = sender.text ?? ""
        case 2:
            delegateInputText = sender.text ?? ""
        default:
            break
        }
        
    }
    
    func delegateInput() -> String {
        return delegateInputText
    }
    
    @IBAction func didEndOnExit(_ sender: Any) {
    }
    
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
    }
}



