//
//  ViewController.swift
//  19.04.02_(Storyboard_Segue_2)
//
//  Created by Solji Kim on 03/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

/*
 - FirstVC 에 텍스트가 -1인 UILabel 과 SecondVC 를 띄우기 위한 UIButton 생성
 
 - SecondVC 에는 4개(10, 20, 30, 40)의 segment를 가진 UISegmentedControl,
 그리고 FirstVC 로 돌아가기 위한 UIButton 생성
 
 - UISegmentedControl 에서 값을 선택한 뒤 버튼을 누르면 그 값이 FirstVC 의 Label 에 표시되도록 구현
 */

class FirstViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
    
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        guard let source = unwindSegue.source as? SecondViewController else { return }
        firstLabel.text = source.label
    }
    
}

