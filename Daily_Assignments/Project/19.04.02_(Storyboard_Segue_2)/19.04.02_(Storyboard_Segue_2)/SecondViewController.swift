//
//  SecondViewController.swift
//  19.04.02_(Storyboard_Segue_2)
//
//  Created by Solji Kim on 03/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var label = "10"
    @IBOutlet weak var secondSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func numSegment(_ sender: Any) {
        switch secondSegment.selectedSegmentIndex {
        case 0:
            label = "10"
        case 1:
            label = "20"
        case 2:
            label = "30"
        case 3:
            label = "40"
        default:
            break
        }
    }
}

