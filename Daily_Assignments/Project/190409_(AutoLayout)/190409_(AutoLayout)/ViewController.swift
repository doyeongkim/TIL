//
//  ViewController.swift
//  190409_(AutoLayout)
//
//  Created by Solji Kim on 10/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit
/*
 [ 과제 ]
 1. 오토레이아웃 연습해보기 (별도 이미지 참고)
 - 5개의 뷰를 생성하고 높이는 150으로 통일
 - Safe Area Top 과 60 의 거리
 - 가장 왼쪽의 뷰는 leading 20, 가장 오른쪽의 뷰는 trailing 20으로 설정하고 각 view 간의 거리는 8로 고정
 - 각 위치에서 오른쪽에 있는 뷰는 왼쪽 뷰 width 의 0.7배에서 해당 위치의 인덱스만큼 뺀 값을 width 값으로 지님
 e.g.
 2번째 뷰의 width는 1번째 뷰 width의 0.7배보다 1 작게 설정
 3번째 뷰의 width는 2번째 뷰 width의 0.7배보다 2 작게 설정
 
 [ 도전 과제 ]
 1. 1차 테스트 3번 과제에서 스토리보드로 프레임 잡은 객체들에 대해 오토레이아웃 적용해보기
 - 노란색 워닝이 나오지 않도록 모두 조정해보기
*/

class ViewController: UIViewController {
    
    let firstView = UIView()
    let secondView = UIView()
    let thirdView = UIView()
    let fourthView = UIView()
    let fifthView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstView.backgroundColor = .black
        view.addSubview(firstView)
        
        secondView.backgroundColor = .black
        view.addSubview(secondView)
        
        thirdView.backgroundColor = .black
        view.addSubview(thirdView)
        
        fourthView.backgroundColor = .black
        view.addSubview(fourthView)
        
        fifthView.backgroundColor = .black
        view.addSubview(fifthView)
        
        activateLayoutAnchors()
        
        print("1: ",view.safeAreaInsets)
        print("2: ", view.safeAreaLayoutGuide)
        print(view.topAnchor)
    }
    
    func activateLayoutAnchors() {
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        firstView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        firstView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.topAnchor.constraint(equalTo:
            view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: 8).isActive = true
        secondView.widthAnchor.constraint(equalTo:
            firstView.widthAnchor, multiplier: 0.7, constant: -1).isActive = true
        secondView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        thirdView.translatesAutoresizingMaskIntoConstraints = false
        thirdView.topAnchor.constraint(equalTo:
            view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        thirdView.leadingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: 8).isActive = true
        thirdView.widthAnchor.constraint(equalTo:
            secondView.widthAnchor, multiplier: 0.7, constant: -2).isActive = true
        thirdView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        fourthView.translatesAutoresizingMaskIntoConstraints = false
        fourthView.topAnchor.constraint(equalTo:
            view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        fourthView.leadingAnchor.constraint(equalTo: thirdView.trailingAnchor, constant: 8).isActive = true
        fourthView.widthAnchor.constraint(equalTo:
            thirdView.widthAnchor, multiplier: 0.7, constant: -3).isActive = true
        fourthView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        fifthView.translatesAutoresizingMaskIntoConstraints = false
        fifthView.topAnchor.constraint(equalTo:
            view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        fifthView.leadingAnchor.constraint(equalTo: fourthView.trailingAnchor, constant: 8).isActive = true
        fifthView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        fifthView.widthAnchor.constraint(equalTo:
            fourthView.widthAnchor, multiplier: 0.7, constant: -4).isActive = true
        fifthView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

