//
//  ViewController.swift
//  CapitalCities
//
//  Created by Atin Agnihotri on 02/08/21.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addCapitals()
    }
    
    func addCapitals() {
        var capitals = [Capital]()
        
        capitals += [Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")]
        capitals += [Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")]
        capitals += [Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")]
        capitals += [Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")]
        capitals += [Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")]
        
//        print("Stuff\(capitals)")
        
//        for capital in capitals {
//            mapView.addAnnotation(capital)
//        }
        mapView.addAnnotations(capitals)
    }


}

