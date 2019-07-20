//
//  BankSaladViewController.swift
//  FirebasePractice
//
//  Created by Solji Kim on 20/07/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit
import FirebaseDatabase

struct CardData {
    var id: String
    var imageOrientation: String
    var imageUrl: UIImage
    var name: String
    var rank: String
}

class BankSaladViewController: UIViewController {

    var ref: DatabaseReference!
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 50
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var cardDataArray = [CardData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setAutolayout()
        
        getDataFromJson()
    }
    
    private func configure() {
        ref = Database.database().reference()
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    private func setAutolayout() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func getDataFromJson() {
        ref.child("cardData").observeSingleEvent(of: .value) { snapshot in
            guard let cardDatas = snapshot.value as? [[String: Any]] else { print("Error parsing!"); return }
//            print(snapshot)
//            print("snapshot.value :", snapshot.value)
//            print("cardDatas :", cardDatas)
            
            cardDatas.forEach{
                guard let id = $0["id"] as? String,
                    let imageOrientation = $0["image_orientaion"] as? String,
                    let imageUrl = $0["image_url"] as? String,
                    let name = $0["name"] as? String,
                    let rank = $0["rank"] as? String
                    else { print("id convert error"); return }
                
                let image = URL(string: imageUrl)!
                
                let dataTask = URLSession.shared.dataTask(with: image) { (data, response, error) in
                   
                    guard let data = data, let images = UIImage(data: data) else { return }
                    
                    let cardData = CardData(id: id, imageOrientation: imageOrientation, imageUrl: images, name: name, rank: rank)
                    
                    self.cardDataArray.append(cardData)
                    
                    DispatchQueue.main.async {
//                        print(self.cardDataArray)
                        self.tableView.reloadData()
                    }
                }
                dataTask.resume()
            }
        }
    }
}

extension BankSaladViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cardDataArray[indexPath.row].name
        cell.imageView?.image = cardDataArray[indexPath.row].imageUrl
        return cell
    }
}
