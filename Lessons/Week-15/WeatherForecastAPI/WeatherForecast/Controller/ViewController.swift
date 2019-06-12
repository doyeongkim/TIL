//
//  ViewController.swift
//  WeatherForecast
//
//  Created by giftbot on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    lazy var verticalStackView = UIStackView(arrangedSubviews: [currentLocationLabel, currentTimeLabel])
    let currentLocationLabel = UILabel()
    let currentTimeLabel = UILabel()
    let refreshButton = UIButton()
    
    let tableView = UITableView()
    
    var skyCode = ""
    var skyName = ""
    var tc = ""
    var tmin = ""
    var tmax = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        autoLayout()
        
        fetchData()
    }
    
    private func configure() {
        backgroundImage.image = UIImage(named: "sunny")
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        
        view.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.isUserInteractionEnabled = false
        verticalStackView.alignment = .center
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .equalCentering
        
        currentLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        currentLocationLabel.backgroundColor = .clear
        currentLocationLabel.textAlignment = .center
        currentLocationLabel.adjustsFontSizeToFitWidth = true
        currentLocationLabel.minimumScaleFactor = 0.75
        currentLocationLabel.textColor = .white
        currentLocationLabel.font = .boldSystemFont(ofSize: UIFont.systemFontSize)
        currentLocationLabel.text = "Cupertino N Blaney Ave"
        
        currentTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTimeLabel.backgroundColor = .clear
        currentTimeLabel.textAlignment = .center
        currentTimeLabel.adjustsFontSizeToFitWidth = true
        currentTimeLabel.minimumScaleFactor = 0.75
        currentTimeLabel.textColor = .white
        currentTimeLabel.font = .systemFont(ofSize: UIFont.smallSystemFontSize)
        currentTimeLabel.text = "오전 11:57"
        
        refreshButton.setImage(UIImage(named: "rotateIcon"), for: .normal)
        refreshButton.addTarget(self, action: #selector(refreshBtnDidTap(_:)), for: .touchUpInside)
        view.addSubview(refreshButton)
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.register(HeaderCell.self, forCellReuseIdentifier: "header")
        tableView.register(DetailCell.self, forCellReuseIdentifier: "detail")
        view.addSubview(tableView)
    }
    
    private func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        verticalStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        verticalStackView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        refreshButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        refreshButton.centerYAnchor.constraint(equalTo: verticalStackView.centerYAnchor).isActive = true
        refreshButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        refreshButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
    }
    
    @objc private func refreshBtnDidTap(_ sender: UIButton) {
        
    }
    
    func fetchData() {
        do {
            let response = try JSONDecoder().decode(Response.self, from: jsonWeatherData)

            response.weather.hourly.forEach {
                skyCode = $0.sky.code
                skyName = $0.sky.name
                tc = $0.temperature.tc
                tmin = $0.temperature.tmin
                tmax = $0.temperature.tmax
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            tableView.rowHeight = 150
            
            guard let headerCell = tableView.dequeueReusableCell(withIdentifier: "header", for: indexPath) as? HeaderCell else { fatalError() }
            
            headerCell.selectionStyle = .none
            
            headerCell.weatherImage.image = UIImage(named: skyCode)
            headerCell.weatherStatus.text = skyName
            headerCell.minTempImage.image = UIImage(named: "lowestIcon")
            headerCell.minTempLabel.text = String(floor(Double(tmin)! * 10) / 10) + "º"
            headerCell.maxTempImage.image = UIImage(named: "highestIcon")
            headerCell.maxTempLabel.text = String(floor(Double(tmax)! * 10) / 10) + "º"
            headerCell.currentTempLabel.text = String(floor(Double(tc)! * 10) / 10) + "º"
            
            return headerCell
            
        } else {
            tableView.rowHeight = 60
            
            guard let detailCell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as? DetailCell else { fatalError() }
    
            detailCell.selectionStyle = .none
            detailCell.dateLabel.text = "5.29 (Mon)"
            detailCell.timeLabel.text = "12:00"
            detailCell.weatherIcon.image = UIImage(named: "SKY_O02")
            detailCell.temperatureLabel.text = "27º"
            
            return detailCell
        }
    }
}

//
//let a = """
//{
//"weather": {
//"hourly": [
//{
//"grid": {
//"longitude": "127.0977600000",
//"latitude": "37.1177600000",
//"county": "오산시",
//"village": "청호동",
//"city": "경기"
//},
//"sky": {
//"code": "SKY_O01",
//"name": "맑음"
//},
//"temperature": {
//"tc": "19.20",
//"tmax": "24.00",
//"tmin": "13.00"
//},
//"timeRelease": "2017-05-25 18:00:00"
//}
//]
//},
//"common": {
//"alertYn": "Y",
//"stormYn": "N"
//},
//"result": {
//"code": 9200,
//"requestUrl": "/weather/current/hourly?version=2&lat=37.123&lon=127.123",
//"message": "성공"
//}
//}
