//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

protocol ItemCellDelegate: class {
    func itemCellDelegating(_ itemCell: ItemCell, button: UIButton)
}

final class ItemCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let qtyLabel = UILabel()
    let addButton = UIButton(type: .contactAdd)
    
    weak var delegate: ItemCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(qtyLabel)
        contentView.addSubview(addButton)
        
        addButton.addTarget(self, action: #selector(addQty), for: .touchUpInside)
    }
    
    @objc func addQty(_ sender: UIButton) {
        delegate?.itemCellDelegating(self, button: sender)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        nameLabel.frame = CGRect(x: 150, y: frame.height/2 - 20, width: 150, height: 40)
        qtyLabel.frame = CGRect(x: frame.width - 100, y: frame.height/2 - 20 , width: 40, height: 40)
        addButton.frame = CGRect(x: frame.width - 50, y: frame.height/2 - 15, width: 30, height: 40)
    
        super.layoutSubviews()
    }
    
}
