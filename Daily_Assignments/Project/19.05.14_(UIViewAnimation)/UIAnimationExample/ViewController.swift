//
//  ViewController.swift
//  UIAnimationExample
//
//  Created by Solji Kim on 14/05/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private struct Time {
        static let short = 0.3
        static let middle = 0.65
        static let long = 1.0
    }
    
    private struct UI {
        static let menuCount = 5
        static let menuSize: CGFloat = 60
        static let distance: CGFloat = 130
        static let minScale: CGFloat = 0.3
    }
    
    private var leftMenuContainer: [UIButton] = []
    private var rightMenuContainer: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstMenu()
    }
    
    private func randomColorGenerator() -> UIColor {
        let r = CGFloat.random(in: 0...1.0)
        let g = CGFloat.random(in: 0...1.0)
        let b = CGFloat.random(in: 0...1.0)
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    private func makeMenuButtonWith(frame: CGRect, title: String) -> UIButton {
        let leftButton = UIButton(frame: frame)
        leftButton.backgroundColor = randomColorGenerator()
        leftButton.setTitle(title, for: .normal)
        leftButton.layer.cornerRadius = leftButton.bounds.width / 2
        leftButton.transform = leftButton.transform.scaledBy(x: UI.minScale, y: UI.minScale)
        view.addSubview(leftButton)
        return leftButton
        
        let rightButton = UIButton(frame: frame)
        rightButton.backgroundColor = randomColorGenerator()
        rightButton.setTitle(title, for: .normal)
        rightButton.layer.cornerRadius = rightButton.frame.width / 2
        rightButton.transform = rightButton.transform.scaledBy(x: UI.minScale, y: UI.minScale)
        view.addSubview(rightButton)
        return rightButton
    }
    
    
    private func setupFirstMenu() {
        
        // leftButton :
        for i in (0..<UI.menuCount) {
            let menuFrame = CGRect(x: 50, y: view.bounds.height - 120, width: UI.menuSize, height: UI.menuSize)
            let button = makeMenuButtonWith(frame: menuFrame, title: "버튼 \(i)")
            leftMenuContainer.append(button)
            
            if i == 0 {
                button.transform = .identity
                button.addTarget(self, action: #selector(firstMenuDidTap(_:)), for: .touchUpInside)
                button.tag = 0
            }
            view.bringSubviewToFront(leftMenuContainer.first!)
        }
        
        // rightButton :
        for i in (0..<UI.menuCount) {
            let menuFrame = CGRect(x: view.frame.width - 100, y: view.frame.height - 120, width: UI.menuSize, height: UI.menuSize)
            let button = makeMenuButtonWith(frame: menuFrame, title: "버튼 \(i)")
            rightMenuContainer.append(button)
            
            if i == 0 {
                button.transform = .identity
                button.addTarget(self, action: #selector(firstMenuDidTap(_:)), for: .touchUpInside)
                button.tag = 1
            }
            view.bringSubviewToFront(rightMenuContainer.first!)
        }
        
    }
    
    @objc func firstMenuDidTap(_ sender: UIButton) {
        print(sender.isSelected)
        
        sender.isSelected.toggle()
        
        func animationUnfoldingBtn(index: Int) {
            
            self.rightMenuContainer[index].transform = .identity
            
            for i in index...4 {
                self.rightMenuContainer[i].center.y -= UI.distance
            }
        }
        
        func animationFoldingBtn(index: Int) {
            
            for i in index...4 {
                self.rightMenuContainer[i].transform = self.rightMenuContainer[i].transform.scaledBy(x: UI.minScale, y: UI.minScale)
                self.rightMenuContainer[i].center.y += UI.distance
            }
        }
        
        switch sender.tag {
            
        case 0:
            UIView.animate(
                withDuration: Time.long,
                delay: 0,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0.0,
                options: [],
                animations: {
                    for (idx, menu) in self.leftMenuContainer.enumerated() {
                        guard idx != 0 else { continue }
                        
                        if sender.isSelected {
                            print("111", sender.isSelected)
                            menu.transform = .identity
                            menu.center.y -= UI.distance * CGFloat(idx)
                        } else {
                            print("222", sender.isSelected)
                            menu.transform = menu.transform.scaledBy(x: UI.minScale, y: UI.minScale)
                            menu.center.y += UI.distance * CGFloat(idx)
                        }
                    }
            })
            
        case 1:
            
            UIView.animateKeyframes(
                withDuration: Time.long,
                delay: 0,
                animations: {
                    
                    UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                        sender.isSelected ? animationUnfoldingBtn(index: 1) : animationFoldingBtn(index: 4)
                    })
                    
                    UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                        sender.isSelected ? animationUnfoldingBtn(index: 2) : animationFoldingBtn(index: 3)
                    })
                    
                    UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                        sender.isSelected ? animationUnfoldingBtn(index: 3) : animationFoldingBtn(index: 2)
                    })
                    
                    UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                        sender.isSelected ? animationUnfoldingBtn(index: 4) : animationFoldingBtn(index: 1)
                    })
            })
            
        default:
            break
        }
    }
}

