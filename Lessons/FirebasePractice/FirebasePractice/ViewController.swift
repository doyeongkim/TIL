//
//  ViewController.swift
//  FirebasePractice
//
//  Created by Solji Kim on 20/07/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAnalytics

class ViewController: UIViewController {
    
    var ref: DatabaseReference!

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름(필수)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "김애플"
        tf.layer.borderColor = UIColor(white: 0.8, alpha: 1).cgColor
        tf.layer.borderWidth = 0.5
        tf.layer.cornerRadius = 3
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일(필수)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "test@gmail.com"
        tf.layer.borderColor = UIColor(white: 0.8, alpha: 1).cgColor
        tf.layer.borderWidth = 0.5
        tf.layer.cornerRadius = 3
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let enterBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("입력하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let checkBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("조회하기", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setAutolayout()
    }
    
    private func configure() {
        title = "입력하기"
        
        view.addSubview(nameLabel)
        
        nameTextField.delegate = self
        view.addSubview(nameTextField)
        
        view.addSubview(emailLabel)
        
        emailTextField.delegate = self
        view.addSubview(emailTextField)
        
        enterBtn.addTarget(self, action: #selector(enterBtnDidTap(_:)), for: .touchUpInside)
        view.addSubview(enterBtn)
        
        checkBtn.addTarget(self, action: #selector(checkBtnDidTap(_:)), for: .touchUpInside)
        view.addSubview(checkBtn)
    }
    
    @objc private func enterBtnDidTap(_ sender: UIButton) {
        saveUserInfo()
    }
    
    @objc private func checkBtnDidTap(_ sender: UIButton) {
        let checkVC = CheckViewController()
        navigationController?.pushViewController(checkVC, animated: true)
    }
    
    private func saveUserInfo() {
        guard let name = nameTextField.text,
            let email = emailTextField.text else { return }
        
        let userInfo = [
            "name": name,
            "email": email
        ]
        
        ref = Database.database().reference()
        
        ref.child("users")
            .childByAutoId()
            .setValue(userInfo) { [weak self] error, _ in
                if let `error` = error {
                    print("Error!!")
                } else {
                    print("데이터가 성공적으로 저장되었습니다.")
                }
        }
        
    }
    
    private func setAutolayout() {
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        enterBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterBtn.bottomAnchor.constraint(equalTo: checkBtn.topAnchor, constant: -30).isActive = true
        
        checkBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        checkBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

