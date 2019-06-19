//
//  ViewController.swift
//  CustomTabBarExample
//
//  Created by Solji Kim on 19/06/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    var pageView = PageView()
    
    var menuTitles = ["menu1", "menu2", "menu3", "menu4", "menu5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageView.menuTitles = menuTitles
        pageView.menuBar.menuCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        
        view.addSubview(pageView)
        
        let guide = view.safeAreaLayoutGuide
        
        pageView.translatesAutoresizingMaskIntoConstraints = false
        pageView.menuBar.indicatorBar.widthAnchor.constraint(equalToConstant: self.view.frame.width / CGFloat(menuTitles.count)).isActive = true
        pageView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        pageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}



