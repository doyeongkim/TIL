//
//  ThirdViewController.swift
//  19.04.11_(UIScrollView)
//
//  Created by Solji Kim on 11/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let pageController = UIPageControl()
    
    let firstView = UIView()
    let secondView = UIView()
    let thirdView = UIView()
    let fourthView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        view.addSubview(scrollView)
        
        firstView.backgroundColor = .red
        scrollView.addSubview(firstView)
        
        secondView.backgroundColor = .orange
        scrollView.addSubview(secondView)
        
        thirdView.backgroundColor = .yellow
        scrollView.addSubview(thirdView)
        
        fourthView.backgroundColor = .green
        scrollView.addSubview(fourthView)
        
        view.addSubview(pageController)
        pageController.numberOfPages = 4
        pageController.pageIndicatorTintColor = .black
        pageController.currentPageIndicatorTintColor = .cyan
        
        activateLayoutAnchors()
    }
    
    func activateLayoutAnchors() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.contentSize = CGSize(width: view.frame.width * 4, height: scrollView.frame.height)
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        firstView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        firstView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        firstView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        firstView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: 0).isActive = true
        secondView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        secondView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        secondView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
        thirdView.translatesAutoresizingMaskIntoConstraints = false
        thirdView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        thirdView.leadingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: 0).isActive = true
        thirdView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        thirdView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        thirdView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
        fourthView.translatesAutoresizingMaskIntoConstraints = false
        fourthView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        fourthView.leadingAnchor.constraint(equalTo: thirdView.trailingAnchor, constant: 0).isActive = true
        fourthView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        fourthView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        fourthView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        fourthView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
        pageController.translatesAutoresizingMaskIntoConstraints = false
        pageController.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        pageController.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pageController.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}

extension ThirdViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / view.frame.width
        pageController.currentPage = Int(page)
    }
}
