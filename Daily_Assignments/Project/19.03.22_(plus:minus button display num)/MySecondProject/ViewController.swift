//
//  ViewController.swift
//  MySecondProject
//
//  Created by Solji Kim on 22/03/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

//[ 실습 문제 ]
//1) -버튼 , +버튼 누르면 숫자가 증가 또는 감소하도록 하기
//2) 숫자가 증가할 때는 label 의 텍스트 색을 파란색,   감소할 때는 빨간색

class ViewController: UIViewController {

    @IBOutlet weak var number: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var num = 0
    
    @IBAction func increaseButton(_ sender: Any) {
        num += 1
        number.textColor = .blue
        number.text = "\(num)"
    }
    
    @IBAction func decreaseButton(_ sender: Any) {
        num -= 1
        number.textColor = .red
        number.text = "\(num)"
    }
}

