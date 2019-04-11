//
//  ViewController.swift
//  LoginPage
//
//  Created by Solji Kim on 05/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

/*
 
 [ 로그인 페이지 필수 구현 기능 ]
 1. 이미지와 동일하게 UI 구현  (스토리보드와 코드 자유)
 2. 텍스트 필드는 delegate 사용
 3. 키보드에 textField 가 가릴 수 있으므로 키보드가 나타날 때는 텍스트필드 위로 끌어올리고 내려갈 때는 같이 내려가기
 4. 미리 설정해둔 아이디와 비밀번호가 동일할 경우 로그인이 완료된 메인 화면으로 이동
 5. 메인 화면에서는 입력받은 아이디를 출력하는 Label 을 띄우고 다시 로그인 화면으로 돌아갈 수 있는 Sign Out 버튼 구성
 
 [ 로그인 페이지 옵션 기능 ]
 1. 텍스트필드에 입력할 수 있는 최대 글자 수는 20자까지.
 2. 아이디와 비밀번호는 모두 4 ~ 16자 사이여야 함.
 3. 미리 설정해둔 아이디와 비밀번호가 다를 경우 텍스트필드의 바탕화면을 일시적으로 빨갛게 만들었다가 원상 복구하기
 
 [ 도전 과제 ]
 1.
 회원가입 페이지를 만든 뒤 회원 가입한 유저의 아이디와 비밀번호를 추가하고
 그것으로도 로그인 할 수 있도록 구현하기
 (해당 건은 답안 없음)
 
 2. 한 번 로그인에 성공했으면 Sign Out을 하기 전에는 앱을 껏다 켜도 자동 로그인된 상태로 메인 화면으로 진입

 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    var check = false
    var emailText = ""
    var pwText = ""
    let email = "dy@gmail.com"
    let pw = "12345"
    var newUserIdDidata = ""
    var newUserPwData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func editingChanged(_ sender: UITextField) {
        
        guard var text = sender.text else { return }
        if text.count > 20 {
            text.removeLast()
            sender.text = text
        }
        
        switch sender.tag {
        case 0:
            emailText = sender.text ?? ""
        case 1:
            pwText = sender.text ?? ""
        default:
            break
        }
        
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        guard identifier == "signIn" else { return true }
        
        guard !(emailText.count < 5 || emailText.count > 16 || pwText.count < 5 || pwText.count > 16) else {
            alert(title: "Error", message: "아이디와 비밀번호는 \n 4~16자 사이를 입력해주세요.")
            return false
        }
        
        
        
        guard (emailText == email && pwText == pw) || (emailText == newUserIdDidata && pwText == newUserPwData) else {
//            alert(title: "Error", message: "아이디나 비밀번호가 맞지 않습니다.")
            UIView.animate(withDuration: 1) {
                self.emailTextField.backgroundColor = .red
                self.pwTextField.backgroundColor = .red
            }
            UIView.animate(withDuration: 1) {
                self.emailTextField.backgroundColor = .white
                self.pwTextField.backgroundColor = .white
            }
            return false
        }
        return true
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let secondVC = segue.destination as? SecondViewController else { return }
        secondVC.emailLabel = emailText
    }
    
        
    @IBAction func unwindToFromSecondVC(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
    override func canPerformUnwindSegueAction(_ action: Selector, from fromViewController: UIViewController, withSender sender: Any) -> Bool {
        
        guard let clickedButton = sender as? UIButton else { return false }
        
        if fromViewController is SecondViewController {
            emailTextField.text = ""
            pwTextField.text = ""
            return true
        } else if let thirdVC2 = fromViewController as? ThirdViewController {
            
            switch clickedButton.tag {
            case 0 :
                let id = thirdVC2.newUserEmail
                let pw = thirdVC2.newUserPw
                
                guard id.count > 5 && id.count < 16 && pw.count > 5 && pw.count < 16 else {
                    
                    let newAlert = UIAlertController(title: "Error", message: "아이디와 비밀번호는 \n 4~16자 사이를 입력해주세요.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "확인", style: .default)
                    
                    newAlert.addAction(okAction)
                    thirdVC2.present(newAlert, animated: true)
                    
                    return false
                }
                return true
            case 1 :
                return true
            default : break
            }
        }
        
        
        return true
        
    }
    
    
    @IBAction func unwindToFromThirdVC(_ unwindSegue: UIStoryboardSegue) {
        guard let thirdVC = unwindSegue.source as? ThirdViewController else { return }
    
        UserDefaults.standard.set(thirdVC.newUserEmail, forKey: "userNewId")
        UserDefaults.standard.set(thirdVC.newUserPw, forKey: "userNewPw")
        
        newUserIdDidata = UserDefaults.standard.string(forKey: "userNewId") ?? ""
        newUserPwData = UserDefaults.standard.string(forKey: "userNewPw") ?? ""
        
        print(newUserIdDidata, newUserPwData)
    }
    
    @IBAction func unwindToFromThirdVC2(_ unwindSegue: UIStoryboardSegue) {
    }
    
    
    func alert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}


extension ViewController : UITextFieldDelegate {
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        switch textField.tag {
//        case 0:
//            emailText = textField.text! + string
//        case 1:
//            pwText = textField.text! + string
//        default:
//            break
//        }
//        return true
//    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        guard check == false else { return }
        
        UIView.animate(withDuration: 0.5) {
            self.loginView.frame.origin.y -= 200
            self.check = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.check = false
        UIView.animate(withDuration: 0.5) {
            self.loginView.frame.origin.y += 200
        }
        return true
    }
    
    
}
