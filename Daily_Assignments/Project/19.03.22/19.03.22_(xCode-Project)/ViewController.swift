//
//  ViewController.swift
//  19.03.22_(xCode-Project)
//
//  Created by Solji Kim on 22/03/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

//[ 과제 ]
//    - UISwitch : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현
//    - UISegmentedControl : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현


class ViewController: UIViewController {

    @IBOutlet weak var onOff: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var segment2: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onOff.text = "Off"
    }
    
    var turn = true
    
    @IBAction func `switch`(_ sender: Any) {
        if turn == true {
            onOff.text = "On"
            turn = false
        } else {
            onOff.text = "Off"
            turn = true
        }
    }

    
    @IBAction func segment(_ sender: Any) {
        switch segment2.selectedSegmentIndex {
        case 0:
            label.text = "First"
        case 1:
            label.text = "Second"
        case 2:
            label.text = "Third"
        case 3:
            label.text = "Fourth"
        default:
            break
        }
    }
}



