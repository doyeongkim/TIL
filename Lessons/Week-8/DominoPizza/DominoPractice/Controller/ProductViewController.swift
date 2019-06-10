//
//  ProductViewController.swift
//  DominoPractice
//
//  Created by Solji Kim on 10/06/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    let tableView = UITableView()
    
    var menu: DominoData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = menu?.category
        
        configure()
    }
    
    private func configure() {
        tableView.frame = view.frame
        tableView.rowHeight = 120
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
}

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "product") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "product")
        }
        
        if let productImage = menu?.products[indexPath.row].productName {
            cell.imageView?.image = UIImage(named: productImage)            
        }
        
        if let menu = menu {
            cell.textLabel?.text = menu.products[indexPath.row].productName
            cell.detailTextLabel?.text = String(menu.products[indexPath.row].price) + "원"
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
}

extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController()
        
        guard let detailImage = menu?.products[indexPath.row].productName else { return }
        detailVC.imageView.image = UIImage(named: detailImage)
        detailVC.productName = menu!.products[indexPath.row].productName
            
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
