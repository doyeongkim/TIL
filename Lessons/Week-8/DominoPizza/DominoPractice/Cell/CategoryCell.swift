//
//  CategoryCell.swift
//  DominoPractice
//
//  Created by Solji Kim on 10/06/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    let categoryImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        setAutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configure() {
        contentView.addSubview(categoryImageView)
    }
    
    private func setAutoLayout() {
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        categoryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        categoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
}
