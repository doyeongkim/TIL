//
//  ViewController.swift
//  19.04.11_(UIScrollView)
//
//  Created by Solji Kim on 11/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

/*
 UIScrollView 에 UIPageControl을 사용하여 현재 페이지를 표시하는 화면 만들기
 (별도 이미지 참고)
 */

class ViewController: UIViewController, UIScrollViewDelegate{
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
//
//    var view1 = UIView()
//    var view2 = UIView()
//    var view3 = UIView()
//    var view4 = UIView()
    
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    var color : [UIColor] = [.red, .orange, .yellow, .green]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = 4
        
        for i in 0...3 {
            frame.origin.x = scrollView.frame.size.width * CGFloat(i)
            frame.size = scrollView.frame.size
            
            let uiView = UIView(frame: frame)
            uiView.backgroundColor = color[i]
            self.scrollView.addSubview(uiView)
        }
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * 4, height: scrollView.frame.size.height)
        scrollView.delegate = self
    
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
}

