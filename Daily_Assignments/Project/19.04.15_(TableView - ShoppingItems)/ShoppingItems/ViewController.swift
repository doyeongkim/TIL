//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!

    var data: [AppleProducts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appleItems()
        
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        
    }
    
    func appleItems() {
        
        let iphone4 = AppleProducts(modelName: "iPhone4", availableQty: 5, buyingQty: 0, image: "iPhone8")
        data.append(iphone4)
        
        let iphone4s = AppleProducts(modelName: "iPhone4s", availableQty: 5, buyingQty: 0, image: "iPhoneSE_Gold")
        data.append(iphone4s)
        
        let iphone5 = AppleProducts(modelName: "iPhone5", availableQty: 7, buyingQty: 0, image: "iPhoneSE_RoseGold")
        data.append(iphone5)
        
        let iphone5s = AppleProducts(modelName: "iPhone5s", availableQty: 3, buyingQty: 0, image: "iPhoneX_SpaceGray")
        data.append(iphone5s)
        
        let iphone6 = AppleProducts(modelName: "iPhone6", availableQty: 6, buyingQty: 0, image: "iPhone8")
        data.append(iphone6)
        
        let iphone6s = AppleProducts(modelName: "iPhone6s", availableQty: 8, buyingQty: 0, image: "iPhoneSE_Gold")
        data.append(iphone6s)
        
        let iphone7 = AppleProducts(modelName: "iPhone7", availableQty: 10, buyingQty: 0, image: "iPhoneSE_RoseGold")
        data.append(iphone7)
        
        let iphone7s = AppleProducts(modelName: "iPhone7s", availableQty: 5, buyingQty: 0, image: "iPhoneX_SpaceGray")
        data.append(iphone7s)
        
        let iphone8 = AppleProducts(modelName: "iPhone8", availableQty: 4, buyingQty: 0, image: "iPhone8")
        data.append(iphone8)
        
        let iphone8s = AppleProducts(modelName: "iPhone8s", availableQty: 3, buyingQty: 0, image: "iPhoneSE_Gold")
        data.append(iphone8s)
        
        let iphoneX = AppleProducts(modelName: "iPhoneX", availableQty: 7, buyingQty: 0, image: "iPhoneSE_RoseGold")
        data.append(iphoneX)
        
        let iphoneXs = AppleProducts(modelName: "iPhoneXs", availableQty: 2, buyingQty: 0, image: "iPhoneX_SpaceGray")
        data.append(iphoneXs)
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        cell.delegate = self
        
        cell.imageView?.image = UIImage(named: data[indexPath.row].image)
        cell.nameLabel.text = "\(data[indexPath.row].modelName)"
        cell.qtyLabel.text = "\(data[indexPath.row].buyingQty)"
        
        return cell
    }
}

// MARK - ItemCellDelegate

extension ViewController: ItemCellDelegate {
    func itemCellDelegating(_ itemCell: ItemCell, button: UIButton) {
        
        if let indexPath = tableView.indexPath(for: itemCell) {
            guard data[indexPath.row].buyingQty < data[indexPath.row].availableQty else {
                UIView.animate(withDuration: 0.8) {
                    self.tableView.cellForRow(at: indexPath)?.backgroundColor = .red
                }
                UIView.animate(withDuration: 0.8) {
                    self.tableView.cellForRow(at: indexPath)?.backgroundColor = .white
                }
                
                let alertController = UIAlertController(title: "주문불가", message: "재고 수량이 없습니다", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
                
                alertController.addAction(okAction)
                present(alertController, animated: true)
                
                return
            }
            data[indexPath.row].buyingQty += 1
            itemCell.qtyLabel.text = "\(data[indexPath.row].buyingQty)"
        }
    }
}

