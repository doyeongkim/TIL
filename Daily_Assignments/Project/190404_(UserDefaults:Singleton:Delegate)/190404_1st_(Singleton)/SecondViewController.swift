//
//  SecondViewController.swift
//  190404_1st_(Singleton)
//
//  Created by Solji Kim on 04/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var userDefaultsLabel: UILabel!
    @IBOutlet weak var singletonLabel: UILabel!
    @IBOutlet weak var delegateLabel: UILabel!
    
    // delegate 위임
    var delegate: DelegateText?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UserDefaults 데이터 불러오기
        let userDefaultsLoadLabel = UserDefaults.standard.string(forKey: "userDefaultsText") ?? ""
        userDefaultsLabel.text = userDefaultsLoadLabel
        
        // singleton
        singletonLabel.text = SingletonText.shared.singletonInputText
        
        // delegate
        delegateLabel.text = delegate?.delegateInput() ?? ""
        
    }
    
}

