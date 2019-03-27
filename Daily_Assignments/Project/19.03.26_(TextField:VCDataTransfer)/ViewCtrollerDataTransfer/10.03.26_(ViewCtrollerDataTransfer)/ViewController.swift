//
//  ViewController.swift
//  10.03.26_(ViewCtrollerDataTransfer)
//
//  Created by Solji Kim on 27/03/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

//  2. ViewController 데이터 전달
//       > AViewController 와 BViewController 를 만들고 각각 하나의 Label 생성.
//       > AViewController 와 BViewController 를 전환할 때마다 각 Label 에 화면을 전환한 숫자 1씩 증가

class ViewController: UIViewController {
    
    let aLabel = UILabel()
    let aButton = UIButton(type: .system)
    var aNum = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        aLabel.frame = CGRect(x: 150, y: 100, width: 50, height: 50)
        aLabel.text = "\(aNum)"
        aLabel.textColor = .red
        view.addSubview(aLabel)
        
        aButton.frame = CGRect(x: 150, y: 400, width: 120, height: 40)
        aButton.addTarget(self, action: #selector(presentBVC), for: .touchUpInside)
        aButton.setTitle("to B", for: .normal)
        aButton.backgroundColor = .blue
        aButton.setTitleColor(.white, for: .normal)
        view.addSubview(aButton)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        aLabel.text = "\(aNum)"
    }
    
    @objc func presentBVC() {
        let bvc = BViewController()
        bvc.bNum = aNum + 1
        present(bvc, animated: true)
    }
    
}

