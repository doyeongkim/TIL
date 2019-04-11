//
//  ViewController.swift
//  19.04.04_1st_(DelegateReverse)
//
//  Created by Solji Kim on 08/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

/*
 2. 일반 과제 (19.04.04_1st) 1번에서
 delegate 프로토콜과 프로퍼티를 firstVC 에 정의하여 구현했다면 secondVC에,
 이것을 secondVC에 정의해 구현했다면 반대로 firstVC에 정의하여 1번 문제 다시 해결하기
 
 */

class ViewController: UIViewController {
    
    var delegateInputText = ""
    var delegate: DelegatePrepareMethod?
    
    @IBOutlet weak var delegateText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        delegateInputText = sender.text ?? ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let destination = segue.destination as? SecondViewController else { return }
        delegate = destination
        delegate?.delegatePrepare(delegateInputText)
        
    }
    
    @IBAction func didEndOnExit(_ sender: Any) {
    }
    
    @IBAction func unwindToFirstVC(_ unwindSegue: UIStoryboardSegue) {
    }

}

