//
//  ViewController.swift
//  19.04.04_(UISlider)
//
//  Created by Solji Kim on 06/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

/*
- Singleton 에 red, green, blue 변수 생성.
- firstview 에 UISlider 를 세개 생성하고 슬라이더 각각의 값을 Singleton 에 각각 저장.
- secondview 에 backgroundcolor 를 singleton 에서 red, green, blue 값을 참조하여 보여주세요.
  (코드로 구현하시오.)
 */

class Colors {
    static let shared = Colors()
    var red: Float = 0.0
    var green: Float = 0.0
    var blue: Float = 0.0
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uiSlider1 = UISlider()
        uiSlider1.frame = CGRect(x: 30, y: 200, width: view.frame.width - 60, height: 35)
        uiSlider1.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        uiSlider1.tag = 0
        
        let redLabel = UILabel()
        redLabel.backgroundColor = .red
        redLabel.frame = CGRect(x: 30, y: uiSlider1.frame.origin.y - 35, width: view.frame.width - 60, height: 30)
        redLabel.text = "Red"
        redLabel.textColor = .white
        view.addSubview(redLabel)
        
        let uiSlider2 = UISlider()
        uiSlider2.frame = CGRect(x: 30, y: 400, width: view.frame.width - 60, height: 35)
        uiSlider2.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        uiSlider2.tag = 1
        
        let greenLabel = UILabel()
        greenLabel.backgroundColor = .green
        greenLabel.frame = CGRect(x: 30, y: uiSlider2.frame.origin.y - 35, width: view.frame.width - 60, height: 30)
        greenLabel.text = "Green"
        greenLabel.textColor = .white
        view.addSubview(greenLabel)
        
        let uiSlider3 = UISlider()
        uiSlider3.frame = CGRect(x: 30, y: 600, width: view.frame.width - 60, height: 35)
        uiSlider3.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        uiSlider3.tag = 2
        
        let blueLabel = UILabel()
        blueLabel.backgroundColor = .blue
        blueLabel.frame = CGRect(x: 30, y: uiSlider3.frame.origin.y - 35, width: view.frame.width - 60, height: 30)
        blueLabel.text = "Blue"
        blueLabel.textColor = .white
        view.addSubview(blueLabel)
        
        let button = UIButton()
        button.frame = CGRect(x: view.frame.width / 2 - 50, y: view.frame.maxY - 100, width: 100, height: 40)
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(nextButton), for: .touchUpInside)
        view.addSubview(button)
        
        uiSlider1.thumbTintColor = .black
        uiSlider2.thumbTintColor = .black
        uiSlider3.thumbTintColor = .black
        
        view.addSubview(uiSlider1)
        view.addSubview(uiSlider2)
        view.addSubview(uiSlider3)
    }
    
    @objc func sliderChanged(_ sender : UISlider) {
        
        switch sender.tag {
        case 0:
            Colors.shared.red = sender.value

        case 1:
            Colors.shared.green = sender.value
            
        case 2:
            Colors.shared.blue = sender.value
            
        default:
            break
        }
        
    }
    
    @objc func nextButton() {
        let secondVC = SecondViewController()
        present(secondVC, animated: true)
    }
}

