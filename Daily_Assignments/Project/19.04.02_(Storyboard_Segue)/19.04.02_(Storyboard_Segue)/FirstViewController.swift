//
//  ViewController.swift
//  19.04.02_(Storyboard_Segue)
//
//  Created by Solji Kim on 02/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit
// [ 과제 ]

/* 2. 스토리보드 이용할 것
    - FirstVC 에 개, 고양이, 새 라는 이름의 UIButton 3개 생성
    - SecondVC 에 UIImageView 하나와 Dismiss 를 위한 버튼 하나 생성
    - FirstVC에 있는 버튼 3개 중 하나를 누르면 그 타이틀에 맞는 이미지를 SecondVC의 ImageView 에 넣기
        (이미지는 구글링 등을 통해 활용)
    - 각 버튼별로 전환 횟수를 세서 개는 8회, 고양이는 10회, 새는 15회가 넘어서면 화면이 전환되지 않도록 막기
    - 그리고 SecondVC 에 추가로 UIButton 을 하나 더 생성하여 그 버튼을 누를 때마다 전환 횟수를 계산하는 값이 개와 고양이, 새 모두에 대해 1회씩 추가되도록 구현
 */

class FirstViewController: UIViewController {
    
    var countForDog = 0
    var countForCat = 0
    var countForBird = 0
    
    @IBOutlet weak var dogLabel: UILabel!
    @IBOutlet weak var catLabel: UILabel!
    @IBOutlet weak var birdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        guard let source = unwindSegue.source as? SecondViewController else { return }
        
        countForDog += source.count
        dogLabel.text = "\(countForDog)"
        
        countForCat += source.count
        catLabel.text = "\(countForCat)"
        
        countForBird += source.count
        birdLabel.text = "\(countForBird)"
        
        switch source.imageID {
        case "dog":
            countForDog += 1
            dogLabel.text = "\(countForDog)"
        case "cat":
            countForCat += 1
            catLabel.text = "\(countForCat)"
        case "bird":
            countForBird += 1
            birdLabel.text = "\(countForBird)"
        default:
            break
        }
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        return countForDog < 8 && countForCat < 10 && countForBird < 15
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let secondVC = segue.destination as? SecondViewController,
        let id = segue.identifier
            else { return }
        
        switch id {
        case "dog":
            secondVC.imageID = "dog"
        case "cat":
            secondVC.imageID = "cat"
        case "bird":
            secondVC.imageID = "bird"
        default:
            break
        }
    }
    

}

