//
//  CategoryViewController.swift
//  DominoPractice
//
//  Created by Solji Kim on 10/06/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    let tableView = UITableView()
    let headerView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Domino's"
        
        configure()
        
    }
    
    private func configure() {
        
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        headerView.image = UIImage(named: "logo")
        headerView.contentMode = .scaleAspectFit
        
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoryCell.self, forCellReuseIdentifier: "category")
        tableView.rowHeight = 100
        tableView.tableHeaderView = headerView
        view.addSubview(tableView)
    }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as? CategoryCell else { return UITableViewCell() }
        
        let categoryImage = menus[indexPath.row].category
        cell.categoryImageView.image = UIImage(named: categoryImage)
        
        return cell
    }
}

extension CategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productVC = ProductViewController()
        productVC.menu = menus[indexPath.row]
//        productVC.title = menus[indexPath.row].category
        navigationController?.pushViewController(productVC, animated: true)
    }
}
