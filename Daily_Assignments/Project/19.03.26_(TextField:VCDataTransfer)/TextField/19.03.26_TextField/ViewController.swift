//
//  ViewController.swift
//  19.03.26_TextField
//
//  Created by Solji Kim on 27/03/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit


//[ 과제 ]
//  1. 영상 참고
//      > 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시.
//      > 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40
//      > 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20


class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func editingDidBegin(_ sender: Any) {
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 40)
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        label.text = sender.text
    }
    
    @IBAction func didEndOnExit(_ sender: Any) {
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 20)
    }
}

