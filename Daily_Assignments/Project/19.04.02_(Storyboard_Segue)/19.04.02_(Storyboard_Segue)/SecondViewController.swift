//
//  SecondViewController.swift
//  19.04.02_(Storyboard_Segue)
//
//  Created by Solji Kim on 02/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var showImage: UIImageView!
    
    var imageID = ""
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showImage.image = UIImage(named: imageID)

    }
    
    @IBAction func addOneForEach(_ sender: Any) {
        count += 1
    }
}
