//
//  SecondViewController.swift
//  19.04.05_(Fake_Kakao)
//
//  Created by Solji Kim on 08/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

//class NewFriends {
//    static let shared = NewFriends()
//    var friends: [String] = []
//}

protocol addNewFriendList {
    func friends(_ input : [String])
}

class SecondViewController: UIViewController{
    
    var friendText = ""
    let friendTextField = UITextField()
    var friendsArray: [String] = []
    
    var friendList : [String] = []
    
    var delegate : addNewFriendList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "친구추가"
        
        friendTextField.frame = CGRect(x: 60, y: 300, width: view.frame.width - 120, height: 45)
        friendTextField.placeholder = "친구 이름을 입력해주세요."
        friendTextField.borderStyle = .roundedRect
        friendTextField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        view.addSubview(friendTextField)
        
        let addButton = UIButton()
        addButton.frame = CGRect(x: 120, y: 550, width: view.frame.width - 240, height: 55)
        addButton.setTitle("추가", for: .normal)
        addButton.backgroundColor = .cyan
        addButton.setTitleColor(.black, for: .normal)
        addButton.addTarget(self, action: #selector(addFriend(_:)), for: .touchUpInside)
        view.addSubview(addButton)
        
    }
    
    // singleton 이용
//    @objc func addFriend(_ sender: Any) {
//        if friendText == "" {
//            alert(title: "Error", message: "이름을 입력하세요")
//            friendTextField.text = ""
//        } else {
//            alert(title: "Success", message: "\(friendText)이(가) 추가되었습니다.")
//            NewFriends.shared.friends.append(friendText)
//            friendTextField.text = ""
//        }
//    }
    
    // delegate 이용
    @objc func addFriend(_ sender: Any) {
        
        if friendText == "" {
            alert(title: "Error", message: "이름을 입력하세요")
        } else {
//            alert(title: "Success", message: "\(friendText)이(가) 추가되었습니다.")
            
            let alertController = UIAlertController(title: "Success", message: "\(friendText)이(가) 추가되었습니다.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "확인", style: .default) { _ in
                self.friendTextField.text = ""
                self.friendText = ""
            }
            alertController.addAction(alertAction)
            present(alertController, animated: true)
            
            friendsArray.append(friendText)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.friends(friendsArray)
    }

    
    @objc func editingChanged(_ sender: UITextField) {
        friendText = sender.text ?? ""
        print(friendText)
    }
    
    func alert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default)
        
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
}
