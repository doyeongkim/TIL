//
//  ViewController.swift
//  WeatherForecast
//
//  Created by giftbot on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import CoreLocation
import UIKit

class ViewController: UIViewController {
    
    let baseUrl = "https://api2.sktelecom.com"
    let appKey = "f24c0fa9-c955-427f-b518-eef54f0bb778"
    
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    lazy var verticalStackView = UIStackView(arrangedSubviews: [currentLocationLabel, currentTimeLabel])
    let currentLocationLabel = UILabel()
    let currentTimeLabel = UILabel()
    let refreshButton = UIButton()
    
    let tableView = UITableView()
    
    var blurView = UIVisualEffectView()
    
    let formatter = DateFormatter()
    var dateString: Date?
    var every3HrsArray = [Date]()
    
    // 현재날씨 (시간별)
    var skyCode = ""
    var skyName = ""
    var tc = ""
    var tmin = ""
    var tmax = ""
    
    // 단기예보
    var forecasts = [Forecast]()
    
    // 현재 시간 레이블에 넣기
    var currentTimeText = "" {
        didSet {
            currentTimeLabel.text = currentTimeText
        }
    }
    
    // 현재위치
    let locationManager = CLLocationManager()
    let geoCoder = CLGeocoder()
    
    private var lastRequestDate = Date(timeIntervalSinceNow: -10)
   
    var currentLocationText = "" {
        didSet {
            currentLocationLabel.text = currentLocationText
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentLocationConfigure()
        getTimeDate()
        
        configure()
        autoLayout()
        
        // test용
//        fetchCurrentForecastTesting()
//        fetchShortForecastTesting()
    }
    
    private func currentLocationConfigure() {
        locationManager.delegate = self
        
        checkAuthorizationStatus()
    }
    
    private func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Disable location features
            break
        case .authorizedWhenInUse:
            fallthrough
        case .authorizedAlways:
            startUpdatingLocation()
        case .denied:
            break
        @unknown default:
            break
        }
    }
    
    private func startUpdatingLocation() {
        let status = CLLocationManager.authorizationStatus()
        
        guard status == .authorizedAlways || status == .authorizedWhenInUse, CLLocationManager.locationServicesEnabled() else { return }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    private func getTimeDate() {
        // 현재 시간 구하기
        let date = Date()
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ko")
        currentTimeText = formatter.string(from: date)
    }
    
    private func configure() {
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
        
        currentTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTimeLabel.backgroundColor = .clear
        currentTimeLabel.textAlignment = .center
        currentTimeLabel.adjustsFontSizeToFitWidth = true
        currentTimeLabel.minimumScaleFactor = 0.75
        currentTimeLabel.textColor = .white
        currentTimeLabel.font = .systemFont(ofSize: UIFont.smallSystemFontSize)
        
        refreshButton.setImage(UIImage(named: "rotateIcon"), for: .normal)
        refreshButton.addTarget(self, action: #selector(refreshBtnDidTap(_:)), for: .touchUpInside)
        view.addSubview(refreshButton)
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HeaderCell.self, forCellReuseIdentifier: "header")
        tableView.register(DetailCell.self, forCellReuseIdentifier: "detail")
        view.addSubview(tableView)
        
        blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        backgroundImage.addSubview(blurView)
    }
    
    // tableview content inset & offset
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tableviewScrollFunction()
        
        blurView.frame = view.frame
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
        tableView.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    }
    
    @objc private func refreshBtnDidTap(_ sender: UIButton) {
        startUpdatingLocation()
        getTimeDate()
        tableView.reloadData()
    }
    
    // 현재 날씨 데이터 test
    func fetchCurrentForecastTesting() {
        do {
            let response = try JSONDecoder().decode(Response.self, from: jsonWeatherData)

            response.weather.hourly.forEach {
                skyCode = $0.sky.code
                skyName = $0.sky.name
                tc = $0.temperature.tc
                tmin = $0.temperature.tmin
                tmax = $0.temperature.tmax
            }
            
            for i in 1...14 {
                
                let boolValue = String(i).count == 1 ? skyCode == "SKY_O0\(i)" : skyCode == "SKY_O\(i)"
                
                if boolValue {
                    switch i {
                    case 1, 2: backgroundImage.image = UIImage(named: "sunny")
                    case 3, 7: backgroundImage.image = UIImage(named: "cloudy")
                    case 4, 5, 6, 8, 9, 10: backgroundImage.image = UIImage(named: "rainy")
                    case 11, 12, 13, 14: backgroundImage.image = UIImage(named: "lightning")
                    default:
                        break
                    }
                }
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // 단기예보 데이터 test
    func fetchShortForecastTesting() {
        
        do {
            let forecastObject = try JSONSerialization.jsonObject(with: jsonForecastData)
            
            guard let forecastDict = forecastObject as? [String : Any] else { return print("No data received") }
            
            guard let weather = forecastDict["weather"] as? [String : [[String:Any]]],
                let forecast3Days = weather["forecast3days"] else { return print("Error in parsing") }
            
            forecast3Days.forEach {
                guard let timeRelease = $0["timeRelease"] as? String,
                    let fcst3Hour = $0["fcst3hour"] as? [String : Any],
                    let sky = fcst3Hour["sky"] as? [String : String],
                    let temperature = fcst3Hour["temperature"] as? [String : String]
                    else { return }
                
                var num = 1
                
                for _ in 1..<(sky.count/2) {
                    num += 3
                    guard let skyValue = sky["code\(num)hour"],
                        let tempValue = temperature["temp\(num)hour"]
                        else { return }
                    
                    // skyValue string 값 바꿔주기  =>  SKY_S07 -> SKY_O07 로
                    let range = String.Index(encodedOffset: 4)..<String.Index(encodedOffset: 5)
                    let skyValueConverted = skyValue.replacingCharacters(in: range, with: "O")
                    
                    let forecast = Forecast(weatherIcon: skyValueConverted, temperature: tempValue)
                    
                    forecasts.append(forecast)
                }
                
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                dateString = formatter.date(from: timeRelease)
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    private func tableviewScrollFunction() {
        
        // tableview content inset
        let topLabelHeight = verticalStackView.frame.height + view.safeAreaInsets.top
        let headerCellHeight: CGFloat = 150
        let tableviewInset = view.frame.height - topLabelHeight - headerCellHeight
        tableView.contentInset = UIEdgeInsets(top: tableviewInset, left: 0, bottom: 0, right: 0)
        
        // tableview content offset
        tableView.contentOffset = CGPoint(x: 0, y: -tableviewInset)
        blurView.alpha = 0
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            tableView.rowHeight = 150
            
            guard let headerCell = tableView.dequeueReusableCell(withIdentifier: "header", for: indexPath) as? HeaderCell else { fatalError() }
            
            headerCell.selectionStyle = .none
            
            headerCell.weatherImage.image = UIImage(named: skyCode)
            headerCell.weatherStatus.text = skyName
            headerCell.minTempImage.image = UIImage(named: "lowestIcon")
            headerCell.minTempLabel.text = String(floor((Double(tmin) ?? 0.0) * 10) / 10) + "º"
            headerCell.maxTempImage.image = UIImage(named: "highestIcon")
            headerCell.maxTempLabel.text = String(floor((Double(tmax) ?? 0.0) * 10) / 10) + "º"
            headerCell.currentTempLabel.text = String(floor((Double(tc) ?? 0.0) * 10) / 10) + "º"
            
            return headerCell
            
        } else {
            tableView.rowHeight = 60
            
            guard let detailCell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as? DetailCell else { fatalError() }
            
            let date: Date = dateString!
            
            let formatter1 = DateFormatter()
            formatter1.dateFormat = "M.dd (EEE)"
            
            let formatter2 = DateFormatter()
            formatter2.dateFormat = "HH:mm"
            
            for i in 0...forecasts.count {
                let AfterDate = date + TimeInterval((3600 * 4 + (3600 * 3 * i)))
                every3HrsArray.append(AfterDate)
            }
    
            detailCell.selectionStyle = .none
            detailCell.dateLabel.text = formatter1.string(from: every3HrsArray[indexPath.row-1])
            detailCell.timeLabel.text = formatter2.string(from: every3HrsArray[indexPath.row-1])
            detailCell.weatherIcon.image = UIImage(named: forecasts[indexPath.row - 1].weatherIcon)
            
            if let temperature = Double(forecasts[indexPath.row - 1].temperature) {
                detailCell.temperatureLabel.text = String(Int(temperature)) + "º"
            }
            
            return detailCell
        }
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let topInset = scrollView.contentInset.top
        let offset = (topInset + scrollView.contentOffset.y) / topInset
        let alpha = 0.8 * (offset > 1 ? 1 : offset)
        blurView.alpha = alpha
    }
}

// MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
//        let location = locations[0] as CLLocation
        
        guard let location = locations.last else { return }
        
        
        // 이전에 받았던 location 값이 캐쉬 형태로 쌓여있을수있음 // 최근 5초 이내에 들어온 위치값만 받겠다
        guard abs(location.timestamp.timeIntervalSinceNow) < 5 else { return }
        
        manager.stopUpdatingLocation()  // 위치를 한번만 받아옴
        
        // 최초 1회에는 밑에 if문에서 데이터를 받아오기 위해 차이값을 주기위해 lastRequestDate에서 -10을 해줌
        let currentDate = Date()
        
        if abs(lastRequestDate.timeIntervalSince(currentDate)) > 2 {
        
            reverseGeocoding(location: location)
            
            fetchCurrentForecast(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
            fetchShortRangeForecast(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
            
            lastRequestDate = currentDate
        }
    }
    
    private func reverseGeocoding(location: CLLocation) {
        
        geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                return print(error.localizedDescription)
            }
            
            guard let address = placemarks?.first,
                let locality = address.locality,
                let subLocality = address.subLocality,
                let thoroughfare = address.thoroughfare
                else { return }
            
            self.currentLocationText = locality + " " + (!subLocality.isEmpty ? subLocality : thoroughfare)
        }
    }
}

// MARK: - ViewController Real API

extension ViewController {
    
    private func fetchCurrentForecast(lat: Double, lon: Double) {
        
        var urlComponents = URLComponents(string: baseUrl)
        urlComponents?.path = "/weather/current/hourly"
        urlComponents?.queryItems = [
            URLQueryItem(name: "appKey", value: appKey),
            URLQueryItem(name: "version", value: String(2)),
            URLQueryItem(name: "lat", value: String(lat)),
            URLQueryItem(name: "lon", value: String(lon))
        ]
        
        guard let url = urlComponents?.url else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else { return }
            
            guard let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode
                else { return }
            
            guard let data = data else { return print("No data received") }
            
            do {
                let currentForecastData = try JSONDecoder().decode(RealCurrentForecast.self, from: data)
                currentForecastData.weather.hourly
                    .forEach {
                        self.skyCode = $0.sky.code
                        self.skyName = $0.sky.name
                        self.tc = $0.temperature.tc
                        self.tmin = $0.temperature.tmin
                        self.tmax = $0.temperature.tmax
                }
                
                for i in 1...14 {
                    
                    let boolValue = String(i).count == 1 ? self.skyCode == "SKY_O0\(i)" : self.skyCode == "SKY_O\(i)"
                    
                    if boolValue {
                        DispatchQueue.main.async {
                            switch i {
                            case 1, 2: self.backgroundImage.image = UIImage(named: "sunny")
                            case 3, 7: self.backgroundImage.image = UIImage(named: "cloudy")
                            case 4, 5, 6, 8, 9, 10: self.backgroundImage.image = UIImage(named: "rainy")
                            case 11, 12, 13, 14: self.backgroundImage.image = UIImage(named: "lightning")
                            default:
                                break
                            }
                        }
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    private func fetchShortRangeForecast(lat: Double, lon: Double) {
        
        var urlComponents = URLComponents(string: baseUrl)
        
        urlComponents?.path = "/weather/forecast/3days"
        urlComponents?.queryItems = [
            URLQueryItem(name: "appKey", value: appKey),
            URLQueryItem(name: "version", value: String(2)),
            URLQueryItem(name: "lat", value: String(lat)),
            URLQueryItem(name: "lon", value: String(lon))
        ]
        
        guard let url = urlComponents?.url else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else { return }
            
            guard let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode
                else { return }
            
            guard let data = data else { return print("No data received") }
            
            do {
                let forecastObject = try JSONSerialization.jsonObject(with: data)
                
                guard let forecastDict = forecastObject as? [String : Any] else { return print("No data received") }
                
                guard let weather = forecastDict["weather"] as? [String : [[String:Any]]],
                    let forecast3Days = weather["forecast3days"] else { return print("Error in parsing") }
                
                forecast3Days.forEach {
                    guard let timeRelease = $0["timeRelease"] as? String,
                        let fcst3Hour = $0["fcst3hour"] as? [String : Any],
                        let sky = fcst3Hour["sky"] as? [String : String],
                        let temperature = fcst3Hour["temperature"] as? [String : String]
                        else { return }
                    
                    var num = 1
                    
                    for _ in 1..<(sky.count/2) {
                        num += 3
                        
                        guard let skyValue = sky["code\(num)hour"],
                            let tempValue = temperature["temp\(num)hour"]
                            else { return }
                        
                        guard skyValue.count > 6 else { // print("skyValue is not valid");
                            continue }
                        
                        // skyValue string 값 바꿔주기  =>  SKY_S07 -> SKY_O07 로
                        let range = String.Index(encodedOffset: 4)..<String.Index(encodedOffset: 5)
                        let skyValueConverted = skyValue.replacingCharacters(in: range, with: "O")
                        let forecast = Forecast(weatherIcon: skyValueConverted, temperature: tempValue)
                        self.forecasts.append(forecast)
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()                            
                        }
                    }
                
                    self.formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    self.dateString = self.formatter.date(from: timeRelease)
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
