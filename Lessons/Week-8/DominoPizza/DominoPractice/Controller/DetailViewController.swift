//
//  DetailViewController.swift
//  DominoPractice
//
//  Created by Solji Kim on 10/06/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let imageView = UIImageView()
    let tempView = UIView()
    let qtyLabel = UILabel()
    let plusButton = UIButton()
    let minusButton = UIButton()
    
    var productName = ""

    var shared = wishListData.shared
    
    var count: Int = 0 {
        didSet {
            qtyLabel.text = "\(count)개"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = productName
        
        configure()
        autoLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let value = shared.wishListDict[productName] else { count = 0; return }
        count = value
    }
    
    private func configure() {
        
        view.backgroundColor = .white
        
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        tempView.backgroundColor = .darkGray
        view.addSubview(tempView)
        
        minusButton.backgroundColor = .white
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor(.black, for: .normal)
        minusButton.titleLabel?.textAlignment = .center
        minusButton.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        minusButton.tag = 0
        tempView.addSubview(minusButton)
        
        plusButton.backgroundColor = .white
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(.black, for: .normal)
        plusButton.titleLabel?.textAlignment = .center
        plusButton.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        plusButton.tag = 1
        tempView.addSubview(plusButton)
        
        qtyLabel.backgroundColor = .clear
        qtyLabel.textAlignment = .center
        qtyLabel.text = "\(count)개"
        qtyLabel.textColor = .white
        tempView.addSubview(qtyLabel)
    }
    
    @objc private func buttonDidTap(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            guard count != 0 else { return }
            count -= 1
        case 1:
            count += 1
        default:
            break
        }
        
        guard count != 0 else { shared.wishListDict[productName] = nil; return }
        shared.wishListDict[productName] = count
    }
    
    
    private func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 70).isActive = true
        imageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        tempView.translatesAutoresizingMaskIntoConstraints = false
        tempView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 70).isActive = true
        tempView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        tempView.widthAnchor.constraint(equalToConstant: 320).isActive = true
        tempView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.leadingAnchor.constraint(equalTo: tempView.leadingAnchor, constant: 5).isActive = true
        minusButton.centerYAnchor.constraint(equalTo: tempView.centerYAnchor).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.trailingAnchor.constraint(equalTo: tempView.trailingAnchor, constant: -5).isActive = true
        plusButton.centerYAnchor.constraint(equalTo: tempView.centerYAnchor).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        qtyLabel.translatesAutoresizingMaskIntoConstraints = false
        qtyLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor).isActive = true
        qtyLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor).isActive = true
        qtyLabel.centerYAnchor.constraint(equalTo: tempView.centerYAnchor).isActive = true
        qtyLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
