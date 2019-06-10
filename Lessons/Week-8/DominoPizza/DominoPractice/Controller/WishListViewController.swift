//
//  WishListViewController.swift
//  DominoPractice
//
//  Created by Solji Kim on 10/06/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {

    let tableView = UITableView()
    
    var shared = wishListData.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Wish List"
        
        naviBarButtonItemSet()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    private func naviBarButtonItemSet() {
        
        let clearButton = UIBarButtonItem(title: "목록 지우기", style: .done, target: self, action: #selector(barButtonItemDidTap(_:)))
        clearButton.tag = 0
        navigationItem.leftBarButtonItem = clearButton
        
        let orderButton = UIBarButtonItem(title: "주문", style: .done, target: self, action: #selector(barButtonItemDidTap(_:)))
        orderButton.tag = 1
        navigationItem.rightBarButtonItem = orderButton
    }
    
    private func configure() {
        
        tableView.frame = view.frame
        tableView.rowHeight = 100
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    @objc private func barButtonItemDidTap(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            shared.wishListDict = [:]
            tableView.reloadData()
        case 1:
            
            let keys = shared.wishListDict.keys.sorted()
            var temp = ""
            var totalAmount = 0
            
            for key in keys {
                for category in menus {
                    for product in category.products {
                        if product.productName == key {
                            temp += "\(key) - \(shared.wishListDict[key]!)개 \n"
                            totalAmount += (shared.wishListDict[key]! * product.price)    
                        }
                    }
                }
            }
            temp += "결제금액 : \(totalAmount)원"
            alert(title: "결제내역", message: temp)
        default:
            break
        }
    }
    
    private func alert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let payAction = UIAlertAction(title: "결제하기", style: .default) { _ in
            self.shared.wishListDict = [:]
            self.tableView.reloadData()
        }
        
        let returnAction = UIAlertAction(title: "돌아가기", style: .cancel, handler: nil)
        
        alertController.addAction(payAction)
        alertController.addAction(returnAction)
        present(alertController, animated: true)
    }
}

extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shared.wishListDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "wishList") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "wishList")
        }
        
        let keys = shared.wishListDict.keys.sorted()
        
        cell.imageView?.image = UIImage(named: keys[indexPath.row])
        cell.textLabel?.text = keys[indexPath.row]
        cell.detailTextLabel?.text = "주문수량 : \(shared.wishListDict[keys[indexPath.row]]!)"
        cell.selectionStyle = .none
        
        return cell
    }
}
