//
//  ViewController.swift
//  19.04.05_(Fake_Kakao)
//
//  Created by Solji Kim on 08/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

/*
 영상과 같이 코드로 구현하시오.
 
 1. UITabbarController에 두개의 ViewController를 생성
 2. 첫번째 ViewController 에 UINavigationController 연결, 친구목록을 표현할 UILabel 생성
 3. 친구추가 ViewController 에서 UITextField 를 생성하고 이름을 입력
 4. TextField 에 입력된 값에 따라 AlertController 띄우기
 5. 첫번째 ViewController 에 돌아왔을때 친구목록 Label 에 이름 표시
 
 ps. (도전과제) 추가된 친구의 이름을 델리게이트패턴으로 구현해주세요~
 
 */



class ViewController: UIViewController, addNewFriendList{
    
    let friendListLabel = UILabel()
    var friendList = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "친구"
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        friendListLabel.frame = CGRect(x: 60, y: 270, width: view.frame.width - 120, height: view.frame.height - 540)
        friendListLabel.backgroundColor = .blue
        friendListLabel.textColor = .white
        friendListLabel.text = "친구없음"
        friendListLabel.textAlignment = .center
        view.addSubview(friendListLabel)
        
        let barButton = UIBarButtonItem(
            title: "친구추가",
            style: .done,
            target: self,
            action: #selector(addNewFriend(_:))
        )
        navigationItem.rightBarButtonItem = barButton
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        guard friendList != "" else {
            friendListLabel.text = "친구없음"
            return
        }
        
        friendListLabel.numberOfLines = 0
        friendListLabel.text = friendList
        
        
//        friendListLabel.numberOfLines = 0
//
//        friendListLabel.text = delegate?.friends(<#T##input: String##String#>)
//
//        friendList = ""
//
//        for i in NewFriends.shared.friends {
//
//            friendList = friendList + "\n" + i
//        }
//
//        guard friendList != "" else { friendListLabel.text = "친구없음"; return}
//
//        friendListLabel.text = friendList
//    }
    }
    
    func friends(_ input: [String]) {
        var result = ""
        for i in input {
            result = result + "\n" + i
        }
        friendList = friendList + result
    }
    
    @objc private func addNewFriend(_ sender: Any) {
        let secondVC = SecondViewController()
        secondVC.delegate = self
        navigationController?.pushViewController(secondVC, animated: true)
        
    }
    
    


}

