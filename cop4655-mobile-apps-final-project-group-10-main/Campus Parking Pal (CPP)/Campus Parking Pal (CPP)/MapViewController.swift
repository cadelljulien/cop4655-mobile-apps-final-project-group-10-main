//
//  MapViewController.swift
//  Campus Parking Pal (CPP)
//
//  Created by Naama Scandarion on 12/3/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    lazy var mapView: MKMapView = {
            let map = MKMapView()
            map.translatesAutoresizingMaskIntoConstraints = false
            //map.overrideUserInterfaceStyle = .dark
            return map
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
        }
        
        private func setupUI() {
            view.addSubview(mapView)
            // add constraints to the mapView
            mapView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            mapView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            mapView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            mapView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
        }

}
