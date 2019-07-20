//
//  CheckViewController.swift
//  FirebasePractice
//
//  Created by Solji Kim on 20/07/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CheckViewController: UIViewController {

    var ref: DatabaseReference!
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름"
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
    
    let userIdLabel: UILabel = {
        let label = UILabel()
        label.text = "UserID"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userIdDisplayLabel: UILabel = {
        let label = UILabel()
        label.text = "UserID가 표시됩니다"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailDisplayLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일이 표시됩니다"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let checkBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("확인하기", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let deleteBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("삭제하기", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setAutolayout()
    }
    
    private func configure() {
        view.backgroundColor = .white
        title = "조회하기"
        
        view.addSubview(nameLabel)
        
        nameTextField.delegate = self
        view.addSubview(nameTextField)
        
        view.addSubview(userIdLabel)
        view.addSubview(userIdDisplayLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailDisplayLabel)
        
        checkBtn.addTarget(self, action: #selector(checkBtnDidTap(_:)), for: .touchUpInside)
        view.addSubview(checkBtn)
        
        deleteBtn.addTarget(self, action: #selector(deleteBtnDidTap(_:)), for: .touchUpInside)
        view.addSubview(deleteBtn)
    }
    
    @objc private func checkBtnDidTap(_ sender: UIButton) {
        checkUserInfo()
    }
    
    @objc private func deleteBtnDidTap(_ sender: UIButton) {
        deleteUserInfo()
    }
    
    private func checkUserInfo() {
        let ref = Database.database().reference()
        
        let userName = nameTextField.text
        
        ref.child("users")
            .queryOrdered(byChild: "name")
            .queryEqual(toValue: userName)
            .queryLimited(toFirst: 1)
            .observeSingleEvent(of: .value) { snapshot in
                guard let userDatas = snapshot.value as? [String: [String: Any]],
                    let userData = userDatas.first else { print("Error!!"); return }
                
                let userId = userData.key
                let value = userData.value
                
                let email = value["email"]
                
                self.userIdDisplayLabel.text = userId
                self.emailDisplayLabel.text = email as? String ?? ""
        }
    }
    
    private func deleteUserInfo() {
        let userId = userIdDisplayLabel.text ?? ""
        
        ref = Database.database().reference()
        
        ref.child("users").child(userId).setValue(nil) { error, _ in
            if let `error` = error {
                print("Error!!")
            } else {
                print("Successfully deleted.")
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
        
        userIdLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 50).isActive = true
        userIdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        
        userIdDisplayLabel.topAnchor.constraint(equalTo: userIdLabel.topAnchor).isActive = true
        userIdDisplayLabel.leadingAnchor.constraint(equalTo: userIdLabel.trailingAnchor, constant: 20).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: userIdLabel.bottomAnchor, constant: 50).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        
        emailDisplayLabel.topAnchor.constraint(equalTo: emailLabel.topAnchor).isActive = true
        emailDisplayLabel.leadingAnchor.constraint(equalTo: userIdDisplayLabel.leadingAnchor).isActive = true
        
        checkBtn.bottomAnchor.constraint(equalTo: deleteBtn.bottomAnchor, constant: -40).isActive = true
        checkBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        deleteBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        deleteBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}


extension CheckViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
