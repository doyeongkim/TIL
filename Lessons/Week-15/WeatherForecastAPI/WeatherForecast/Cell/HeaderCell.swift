//
//  HeaderCell.swift
//  WeatherForecast
//
//  Created by Solji Kim on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    let weatherImage = UIImageView()
    let weatherStatus = UILabel()
    let minTempImage = UIImageView()
    let minTempLabel = UILabel()
    let maxTempImage = UIImageView()
    let maxTempLabel = UILabel()
    let currentTempLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        configure()
        autoLayout()
    }
    
    private func configure() {
        
        self.backgroundColor = .clear
        
        addSubview(weatherImage)
        
        weatherStatus.textColor = .white
        weatherStatus.font = UIFont.systemFont(ofSize: 15, weight: .light)
        addSubview(weatherStatus)
        
        addSubview(minTempImage)
        
        minTempLabel.textColor = .white
        minTempLabel.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        addSubview(minTempLabel)
        
        addSubview(maxTempImage)
        
        maxTempLabel.textColor = .white
        maxTempLabel.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        addSubview(maxTempLabel)
        
        currentTempLabel.textColor = .white
        currentTempLabel.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        addSubview(currentTempLabel)
    }
    
    private func autoLayout() {
        
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        weatherImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        weatherImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        weatherImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        weatherStatus.translatesAutoresizingMaskIntoConstraints = false
        weatherStatus.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        weatherStatus.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor, constant: 5).isActive = true
        weatherStatus.bottomAnchor.constraint(equalTo: weatherImage.bottomAnchor).isActive = true
        
        minTempImage.translatesAutoresizingMaskIntoConstraints = false
        minTempImage.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 5).isActive = true
        minTempImage.centerXAnchor.constraint(equalTo: weatherImage.centerXAnchor).isActive = true
        minTempImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        minTempImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        minTempLabel.translatesAutoresizingMaskIntoConstraints = false
        minTempLabel.leadingAnchor.constraint(equalTo: minTempImage.trailingAnchor, constant: 3).isActive = true
        minTempLabel.topAnchor.constraint(equalTo: minTempImage.topAnchor).isActive = true
        minTempLabel.bottomAnchor.constraint(equalTo: minTempImage.bottomAnchor).isActive = true
        
        maxTempImage.translatesAutoresizingMaskIntoConstraints = false
        maxTempImage.topAnchor.constraint(equalTo: minTempImage.topAnchor).isActive = true
        maxTempImage.leadingAnchor.constraint(equalTo: minTempLabel.trailingAnchor, constant: 8).isActive = true
        maxTempImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        maxTempImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        maxTempLabel.translatesAutoresizingMaskIntoConstraints = false
        maxTempLabel.leadingAnchor.constraint(equalTo: maxTempImage.trailingAnchor, constant: 3).isActive = true
        maxTempLabel.topAnchor.constraint(equalTo: maxTempImage.topAnchor).isActive = true
        maxTempLabel.bottomAnchor.constraint(equalTo: maxTempImage.bottomAnchor).isActive = true
        
        currentTempLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTempLabel.topAnchor.constraint(equalTo: maxTempLabel.bottomAnchor, constant: 5).isActive = true
        currentTempLabel.leadingAnchor.constraint(equalTo: minTempImage.leadingAnchor).isActive = true
    }
}
