//
//  ViewController.swift
//  alertController exercise
//
//  Created by Solji Kim on 25/03/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

//[ 과제 ]
//  AlertController 를 통해 Label 의 숫자를 1씩 올리거나 초기화하기
//  (위 내용을 스토리보드로  구현하기는 연습. 스토리보드 없이 완전히 코드로만으로 구현하는 것이 과제)

//  [ 도전문제 ]
//  AlertController 에 TextField 를 추가해서 Label 의 숫자를 원하는 대로 증가시키기


class ViewController: UIViewController {
    
    var label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 21))
    let button = UIButton(type: .system)
    var num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "0"
        view.addSubview(label)
        
        button.frame = CGRect(x: 150, y: 150, width: 80, height: 35)
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(upButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func upButton(_ sender: Any) {
        let alertController = UIAlertController(
            title: "Wanna increment the number?",
            message: "Click 'Up' button to + 1 or enter the amount how much you want to increase",
            preferredStyle: .alert
        )
        
        alertController.addTextField()
        
//        let upAction = UIAlertAction(
//            title: "Up",
//            style: .default) { _ in
//                self.num += 1
//                self.label.text = "\(self.num)"
//        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
           if let text = alertController.textFields?.first?.text {
            
                self.num += Int(text) ?? 1
                self.label.text = "\(self.num)"
            }
        }
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        )
        
        let resetAction = UIAlertAction(title: "Reset", style: .destructive) { _ in
            self.num = 0
            self.label.text = "\(self.num)"
        }
        
//        alertController.addAction(upAction)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        alertController.addAction(resetAction)
        present(alertController, animated: true)
    }
}



