//
//  ViewController.swift
//  19.04.30_(Notification)
//
//  Created by Solji Kim on 01/05/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

/*
 [ 과제 ]
 - RGBA 값을 지닌 UISlider와 NotificationCenter를 이용해 배경색상 변경하기
 > 탭바컨트롤러의 FirstVC에서 슬라이더값을 조절하고 버튼을 누르면 Notification 이벤트를 발생시키는 코드 작성
 > SecondVC에서 Notification을 전달받아 RGBA를 조합하여 배경색 변경
 
 [ 도전 과제 ]
 - FirstVC의 TextField에 입력한 내용을 NotificationCenter를 이용해 SecondVC의 Label로 전달하기
 > NavigationController 이용
 */

extension Notification.Name {
    static let colorNotification = Notification.Name("ColorNotification")
    static let textNotification = Notification.Name("TextNotification")
}

class ViewController: UIViewController {

    let redSlider = UISlider()
    let greenSlider = UISlider()
    let blueSlider = UISlider()
    let alphaSlider = UISlider()

    let redLabel = UILabel()
    let greenLabel = UILabel()
    let blueLabel = UILabel()
    let alphaLabel = UILabel()
    
    let setColorButton = UIButton(type: .system)
    
    let textField = UITextField()
    
    let notiCenter = NotificationCenter.default
    var mixedColor = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        
        setAutoLayout()

    }
    
    func configure() {
        
        redLabel.text = "Red"
        view.addSubview(redLabel)
        
        greenLabel.text = "Green"
        view.addSubview(greenLabel)
        
        blueLabel.text = "Blue"
        view.addSubview(blueLabel)
        
        alphaLabel.text = "Alpha"
        view.addSubview(alphaLabel)
        
        redSlider.addTarget(self, action: #selector(didSliderValueChanged(_:)), for: .valueChanged)
        view.addSubview(redSlider)
        
        greenSlider.addTarget(self, action: #selector(didSliderValueChanged(_:)), for: .valueChanged)
        view.addSubview(greenSlider)
        
        blueSlider.addTarget(self, action: #selector(didSliderValueChanged(_:)), for: .valueChanged)
        view.addSubview(blueSlider)
        
        alphaSlider.addTarget(self, action: #selector(didSliderValueChanged(_:)), for: .valueChanged)
        view.addSubview(alphaSlider)
        
        setColorButton.setTitle("Set Color", for: .normal)
        setColorButton.setTitleColor(.blue, for: .normal)
        setColorButton.addTarget(self, action: #selector(postColorNotification(_:)), for: .touchUpInside)
        view.addSubview(setColorButton)
        
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.addTarget(self, action: #selector(editingDidEndOnExit(_:)), for: .editingDidEndOnExit)
        view.addSubview(textField)
    }
    
    @objc func postColorNotification(_ sender: Any) {
//        notiCenter.post(name: .colorNotification, object: mixedColor, userInfo: nil)
        notiCenter.post(name: .colorNotification, object: sender, userInfo: ["colors" : mixedColor])
    }
    
    @objc func didSliderValueChanged(_ sender: UISlider) {
        let r = CGFloat(redSlider.value)
        let g = CGFloat(greenSlider.value)
        let b = CGFloat(blueSlider.value)
        let alpha = CGFloat(alphaSlider.value)
        mixedColor = UIColor(red: r, green: g, blue: b, alpha: alpha)
    }

    @objc func editingDidEndOnExit(_ sender: UITextField) {
        let thirdVC = ThirdViewController()
        thirdVC.addNotificationObserver()
        navigationController?.pushViewController(thirdVC, animated: true)
        
        notiCenter.post(name: .textNotification, object: sender)
    }
    
    func setAutoLayout() {
        let guide = view.safeAreaLayoutGuide

        redLabel.translatesAutoresizingMaskIntoConstraints = false
        redLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
        redLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 25).isActive = true
        redLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        redLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        redSlider.translatesAutoresizingMaskIntoConstraints = false
        redSlider.centerYAnchor.constraint(equalTo: redLabel.centerYAnchor).isActive = true
        redSlider.leadingAnchor.constraint(equalTo: redLabel.trailingAnchor, constant: 5).isActive = true
        redSlider.widthAnchor.constraint(equalToConstant: 250).isActive = true
        redSlider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        greenLabel.translatesAutoresizingMaskIntoConstraints = false
        greenLabel.topAnchor.constraint(equalTo: redLabel.topAnchor, constant: 50).isActive = true
        greenLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 25).isActive = true
        greenLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        greenLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        greenSlider.translatesAutoresizingMaskIntoConstraints = false
        greenSlider.centerYAnchor.constraint(equalTo: greenLabel.centerYAnchor).isActive = true
        greenSlider.leadingAnchor.constraint(equalTo: greenLabel.trailingAnchor, constant: 5).isActive = true
        greenSlider.widthAnchor.constraint(equalToConstant: 250).isActive = true
        greenSlider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        blueLabel.translatesAutoresizingMaskIntoConstraints = false
        blueLabel.topAnchor.constraint(equalTo: greenLabel.topAnchor, constant: 50).isActive = true
        blueLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 25).isActive = true
        blueLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        blueLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        blueSlider.translatesAutoresizingMaskIntoConstraints = false
        blueSlider.centerYAnchor.constraint(equalTo: blueLabel.centerYAnchor).isActive = true
        blueSlider.leadingAnchor.constraint(equalTo: blueLabel.trailingAnchor, constant: 5).isActive = true
        blueSlider.widthAnchor.constraint(equalToConstant: 250).isActive = true
        blueSlider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        alphaLabel.translatesAutoresizingMaskIntoConstraints = false
        alphaLabel.topAnchor.constraint(equalTo: blueLabel.topAnchor, constant: 50).isActive = true
        alphaLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 25).isActive = true
        alphaLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        alphaLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        alphaSlider.translatesAutoresizingMaskIntoConstraints = false
        alphaSlider.centerYAnchor.constraint(equalTo: alphaLabel.centerYAnchor).isActive = true
        alphaSlider.leadingAnchor.constraint(equalTo: alphaLabel.trailingAnchor, constant: 5).isActive = true
        alphaSlider.widthAnchor.constraint(equalToConstant: 250).isActive = true
        alphaSlider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        setColorButton.translatesAutoresizingMaskIntoConstraints = false
        setColorButton.topAnchor.constraint(equalTo: alphaSlider.bottomAnchor, constant: 30).isActive = true
        setColorButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        setColorButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        setColorButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: setColorButton.bottomAnchor, constant: 50).isActive = true
        textField.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
}

