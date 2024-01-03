//
//  DetailViewController.swift
//  Campus Parking Pal (CPP)
//
//  Created by Cadell Julien on 12/3/23.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, MKMapViewDelegate {
   
    @IBOutlet var mapView: MKMapView!
    
    var building: Building!
   

        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            let centerCoordinate = CLLocationCoordinate2D(latitude: 26.37386, longitude: -80.10195)
            let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            let region = MKCoordinateRegion(center: centerCoordinate, span: span)
            
            mapView.setRegion(region, animated: true)
            
            mapView.delegate = self
            
            mapView.removeAnnotations(mapView.annotations)
            
            updateMapView()
            
        }

    func updateMapView(){
        guard let building = building else {
            print("not working")
            return
        }
        
        let annotation = MKPointAnnotation()
        annotation.title = building.closestLot
        annotation.coordinate = CLLocationCoordinate2D(latitude:building.parkingLatitude , longitude: building.parkingLongitude )
        mapView.addAnnotation(annotation)
  
        
    }
    
  
}


