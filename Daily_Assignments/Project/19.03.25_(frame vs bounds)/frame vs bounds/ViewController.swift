//
//  ViewController.swift
//  frame vs bounds
//
//  Created by Solji Kim on 25/03/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let blueView = UIView()
    let redView = UIView()
    let yellowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueView.frame = CGRect(x: 30, y: 30, width: view.frame.size.width - 60, height: view.frame.size.height - 60)
        blueView.backgroundColor = .blue
        
        redView.frame = CGRect(x: 30, y: 30, width: view.frame.size.width - 120, height: view.frame.size.height - 120)
        redView.backgroundColor = .red
        
        yellowView.frame = CGRect(x: 30, y: 30, width: view.frame.size.width - 180, height: view.frame.size.height - 180)
        yellowView.backgroundColor = .yellow
        
        view.addSubview(blueView)
        blueView.addSubview(redView)
        redView.addSubview(yellowView)
        
        //        blueView.frame.origin = CGPoint(x: 0, y: 0)
        //        redView.frame.origin = CGPoint(x: 30, y: 30)
        //        yellowView.frame.origin = CGPoint(x: 30, y: 30)
        //
        //        blueView.bounds.origin = CGPoint(x: 50, y: 50)
        //        redView.bounds.origin = CGPoint(x: 35, y: 35)
        //        yellowView.bounds.origin = CGPoint(x: 50, y: 50)
    }
}


