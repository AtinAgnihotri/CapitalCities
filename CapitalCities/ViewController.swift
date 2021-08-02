//
//  ViewController.swift
//  CapitalCities
//
//  Created by Atin Agnihotri on 02/08/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavBar()
        addCapitals()
    }
    
    func setupNavBar() {
        title = "Capital Cities"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(switchMapTypes))
    }
    
    @objc func switchMapTypes() {
        let standard = UIAlertAction(title: "Standard", style: .default) { [weak self] _ in
            self?.mapView.mapType = .standard
        }
        let satellite = UIAlertAction(title: "Satellite", style: .default) { [weak self] _ in
            self?.mapView.mapType = .satellite
        }
        let hybrid = UIAlertAction(title: "Hybrid", style: .default) { [weak self] _ in
            self?.mapView.mapType = .hybrid
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        showActionSheet(title: "Change Map Type", actions: [standard, satellite, hybrid, cancel])
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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        
        annotationView?.pinTintColor = UIColor.systemBlue
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        guard let capitalName = capital.title else { return }
        let ok = UIAlertAction(title: "OK", style: .default)
        let details = UIAlertAction(title: "Details", style: .default) { [weak self] _ in
            self?.showCapitalDetails(capitalName)
        }
        showAlert(title: capital.title, message: capital.info, actions: [ok, details])
    }
    
    func showCapitalDetails(_ capital: String) {
        let vc = DetailsViewController()
        vc.city = capital
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showAlert(title: String?, message: String? = nil, actions: [UIAlertAction]) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            ac.addAction(action)
        }
        present(ac, animated: true)
    }
    
    func showActionSheet(title: String?, message: String? = nil, actions: [UIAlertAction]) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for action in actions {
            ac.addAction(action)
        }
        present(ac, animated: true)
    }
    
}

