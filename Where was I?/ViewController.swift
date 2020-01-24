//
//  ViewController.swift
//  Where was I?
//
//  Created by Clarette Terrasi on 22/01/2020.
//  Copyright © 2020 Clarette Terrasi Díaz. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        UpdateSavedPin()
    }
    
    func UpdateSavedPin() {
        if let oldCoordinates = DataStore().GetLastLocation() {
            
            let annotationRemove = mapView.annotations.filter { $0 !== mapView.userLocation}
            mapView.removeAnnotations(annotationRemove)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = Double(oldCoordinates.latitude)!
            annotation.coordinate.longitude = Double(oldCoordinates.longitude)!
            
            annotation.title = "I was here!"
            annotation.subtitle = "Remember?"
            mapView.addAnnotation(annotation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            print("Location not enabled!")
            return
        }
        
        print("Location allowed")
        mapView.showsUserLocation = true
    }

    @IBAction func addLocation(_ sender: Any) {
        let coordinates = locationManager.location?.coordinate
        
        if let lat = coordinates?.latitude {
            if let long = coordinates?.longitude {
                DataStore().StoreDataPoint(latitude: String(lat), longitude: String(long))
            }
        }
        UpdateSavedPin()
    }
    
}


