//
//  ViewController.swift
//  19.05.10_(MapKit)
//
//  Created by Solji Kim on 11/05/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import MapKit
import UIKit

/*
 [ 과제 ]
 1. 입력한 주소들을 차례대로 잇는 선 만들기   (샘플 영상 참고)
 > 텍스트필드에 주소를 입력하면 해당 위치로 애니메이션과 함께 맵 이동 (CoordinateSpan 값 - 0.02)
 > 입력한 주소값으로 이동한 뒤 그 위치를 표시하기 위한 사각형 그리기 + Annotation 추가하기
 > Annotation 의 제목은 1번째 행선지, 2번째 행선지 처럼 순서를 표시하고, 부제목은 그 곳의 주소 나타내기
 > 마지막으로 입력한 주소값과 그 직전의 주소값 사이에 선 그리기
 (가장 처음 입력한 주소는 그것과 연결할 직전의 주소값이 없으므로 제외)
 */

class Annotation: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let center = CLLocationCoordinate2DMake(37.566308, 126.977948)
        setRegion(coordinate: center)
        
    }
    
    func setRegion(coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func didEndOnExit(_ sender: UITextField) {
        
        let address = sender.text ?? ""
        let geocoder = CLGeocoder()
        let annotation = MKPointAnnotation()
        var coordinate = CLLocationCoordinate2D()

        geocoder.geocodeAddressString(address) { (placeMark, error) in
            //            print("plcaeMark : ", placeMark!)
            //            print("location : ", placeMark!.first!.location!)
            //            print("coordinate : ", placeMark!.first!.location!.coordinate)
            
            coordinate = placeMark!.first!.location!.coordinate
            
            annotation.title = "\(self.mapView.annotations.count + 1)번째 행선지"
            annotation.subtitle = address
            annotation.coordinate = coordinate
            
            self.mapView.addAnnotation(annotation)
            self.setRegion(coordinate: coordinate)
            
            self.showRoute(currentCoordinate: coordinate)

            if let _ = self.polyline {
                self.mapView.removeOverlay(self.polyline!)
            }
            
            self.addSquare(coordinate: coordinate)
        }
        
    }
    
    var polyline: MKPolyline?
    
    func addSquare(coordinate: CLLocationCoordinate2D) {
        
        let center = coordinate
        
        var point1 = center; point1.longitude += 0.03; point1.latitude -= 0.02
        var point2 = center; point2.longitude += 0.03; point2.latitude += 0.02
        var point3 = center; point3.longitude -= 0.03; point3.latitude += 0.02
        var point4 = center; point4.longitude -= 0.03; point4.latitude -= 0.02
        
        let points: [CLLocationCoordinate2D] = [point1, point2, point3, point4, point1]
        polyline = MKPolyline(coordinates: points, count: points.count)
        
        mapView.addOverlay(polyline!)
    }
    
    var prevCoordinate: CLLocationCoordinate2D?
    
    func showRoute(currentCoordinate: CLLocationCoordinate2D) {
        
        guard prevCoordinate != nil else { prevCoordinate = currentCoordinate; return }
 
        let points: [CLLocationCoordinate2D] = [prevCoordinate!, currentCoordinate]
        let routePolyline = MKPolyline(coordinates: points, count: points.count)
        
        mapView.addOverlay(routePolyline)
        
        prevCoordinate = currentCoordinate
    }
}

// MARK - MKMapViewDelegate

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if let polyline = overlay as? MKPolyline {
            
            let renderer = MKPolylineRenderer(polyline: polyline)
            
            renderer.lineWidth = 2
    
            if renderer.polyline == self.polyline {
                renderer.strokeColor = .red
            } else {
                renderer.strokeColor = .blue
            }
   
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}

