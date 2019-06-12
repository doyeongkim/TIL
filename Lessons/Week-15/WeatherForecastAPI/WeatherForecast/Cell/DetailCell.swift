//
//  DetailCell.swift
//  WeatherForecast
//
//  Created by Solji Kim on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    let weatherIcon = UIImageView()
    let separateView = UIView()
    let temperatureLabel = UILabel()
    
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
        
        dateLabel.textColor = .white
        dateLabel.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        contentView.addSubview(dateLabel)
        
        timeLabel.textColor = .white
        timeLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        contentView.addSubview(timeLabel)
        
        contentView.addSubview(weatherIcon)
        
        separateView.backgroundColor = .lightGray
        contentView.addSubview(separateView)
        
        temperatureLabel.textColor = .white
        temperatureLabel.font = UIFont.systemFont(ofSize: 30, weight: .thin)
        contentView.addSubview(temperatureLabel)
    }
    
    private func autoLayout() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor).isActive = true
        
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        weatherIcon.topAnchor.constraint(equalTo: dateLabel.topAnchor).isActive = true
        weatherIcon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 50).isActive = true
        weatherIcon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        weatherIcon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        separateView.translatesAutoresizingMaskIntoConstraints = false
        separateView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        separateView.leadingAnchor.constraint(equalTo: weatherIcon.leadingAnchor, constant: -5).isActive = true
        separateView.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
        separateView.widthAnchor.constraint(equalTo: weatherIcon.widthAnchor, constant: 10).isActive = true
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }

}
