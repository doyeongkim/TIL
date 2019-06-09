//
//  ViewController.swift
//  ITunesSearchAPI
//
//  Created by Solji Kim on 07/06/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    let tableView = UITableView()
    
    var albums = [Albums]()

    let activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Music Search"
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        searchController.searchBar.placeholder = "Search by artist or song"
        searchController.obscuresBackgroundDuringPresentation = true
        
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.rowHeight = 60
        view.addSubview(tableView)
        
        activityIndicator.center = view.center
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
//        if let imageUrlString = self.albums[indexPath.row].artworkUrl100 {
//            let imageUrl = URL(string: imageUrlString)!
//            if let imageData = try? Data(contentsOf: imageUrl) {
//                cell.imageView?.image = UIImage(data: imageData)
//            }
//        }
        
        
//        DispatchQueue.global(qos: .background).async {
//            if let imageUrlString = self.albums[indexPath.row].artworkUrl100 {
//                let imageUrl = URL(string: imageUrlString)!
//
//                guard let data = try? Data(contentsOf: imageUrl) else { return }
//
//                if let image: UIImage = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        cell.imageView?.image = image
//                        cell.textLabel?.text = self.albums[indexPath.row].trackName
//                        cell.detailTextLabel?.text = self.albums[indexPath.row].artistName
//                    }
//                }
//            }
//        }
        
        
//        if let imageUrlString = self.albums[indexPath.row].artworkUrl100 {
//            let imageUrl = URL(string: imageUrlString)!
//            cell.imageView?.kf.setImage(with: imageUrl)
//        }
        
        cell.imageView?.image = self.albums[indexPath.row].artworkUrl100
        cell.textLabel?.text = self.albums[indexPath.row].trackName
        cell.detailTextLabel?.text = self.albums[indexPath.row].artistName
        
        return cell
    }
}


// MARK: - UISearchResultsUpdating

extension ViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        self.albums.removeAll()
        
        self.activityIndicator.startAnimating()
        
        let searchText = searchController.searchBar.text ?? ""
        let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=" + searchText
        
        let request = AF.request(urlString)
        
        request.responseJSON { response in
            
            switch response.result {
            case .success(let value):
                //                print(value)
                guard let albumInfo = value as? [String:Any],
                    let results = albumInfo["results"] as? [[String:Any]]
                    else { return print("No data received") }
                //                print(results)
                
                results
                    .forEach {
                        guard let artistName = $0["artistName"] as? String,
                            let trackName = $0["trackName"] as? String,
                            let artworkUrl100 = $0["artworkUrl100"] as? String
                            else { return print("Error in parsing") }
                        
                        let imageUrl = URL(string: artworkUrl100)!
                        
                        let dataTask = URLSession.shared.dataTask(with: imageUrl) {
                            (data, response, error) in
                            
                            guard let data = data, let image = UIImage(data: data) else { return }
                            
                            let album = Albums(artistName: artistName, trackName: trackName, artworkUrl100: image)
                            self.albums.append(album)
//                            print(album)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                self.activityIndicator.stopAnimating()
                            }
                        }
                        dataTask.resume()
                    }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UISearchBarDelegate

extension ViewController: UISearchBarDelegate {
    
}
