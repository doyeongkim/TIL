//
//  ViewController.swift
//  19.04.09_BogusAlertController
//
//  Created by Solji Kim on 10/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

/*
 [클매과제]
  *UIAlertController 와 비슷한 기능을 구현해봅시다.
 1. FirstViewController 에서 버튼을 생성하고 present 를 통해 SecondVIewController 를 띄운다
 2. 회색의 UIView 를 하나 생성하고 안에 색을 바꿀수있는 버튼과 FirstViewController 로 돌아올수있는 버튼을 구현하라.
*/

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = 
    }
    
    
    @IBAction func alertButton(_ sender: Any) {
//        let secondVC = SecondViewController()
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        storyboard.instantiateInitialViewController()
//
        guard let secondVC = storyboard?
            .instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        secondVC.modalPresentationStyle = .overCurrentContext
        present(secondVC, animated: true)
    }
}



