//
//  ViewController.swift
//  19.05.07_(UIGestureRecognizer)
//
//  Created by Solji Kim on 09/05/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

/*
 [ 도전 과제 ]
 샘플 영상을 보고 동일하게 동작하도록 구현
 - touchesBegan 메서드 이용
 
 - UITapGestureRecognizer 이용
 이전에 탭한 위치에서 거리가 10 이상이면 새로운 탭인 것으로 계산
 */

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var coordinateLabel: UILabel!
    
    var count = 0 {
        willSet {
            countLabel.text = "횟수 : \(newValue)"
        }
    }
    
    var oldTouchPoint = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//
//        guard let touch = touches.first else { return }
//        let touchPoint = touch.location(in: touch.view)
//
//        coordinateLabel.text = "좌표 : \(touchPoint)"
//
//        if abs(touchPoint.x - oldTouchPoint.x) < 10 || abs(touchPoint.y - oldTouchPoint.y) < 10 {
//            count += 1
//        } else {
//            count = 1
//        }
//
//        oldTouchPoint = touchPoint
//    }
    
    @IBAction func handleTapGesture(_ sender: UITapGestureRecognizer) {

        let touchPoint = sender.location(in: self.view)

        coordinateLabel.text = "좌표 : \(touchPoint)"
        
        if abs(touchPoint.x - oldTouchPoint.x) < 10 || abs(touchPoint.y - oldTouchPoint.y) < 10 {
            count += 1
        } else {
            count = 1
        }
        
        oldTouchPoint = touchPoint
    }
}

