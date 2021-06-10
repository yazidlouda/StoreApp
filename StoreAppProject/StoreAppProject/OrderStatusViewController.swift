//
//  OrderStatusViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/22/21.
//

import UIKit
import MapKit

class OrderStatusViewController: UIViewController, CLLocationManagerDelegate {
 static var order = ""
    @IBOutlet weak var orderNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getLocation()

    }
    
    let ann = MKPointAnnotation()
    
    func getLocation() {
        
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
            case .notDetermined :
                locationM.requestWhenInUseAuthorization()
                return
                
            case .denied, .restricted :
                let art = UIAlertController(title: "Location disabled",     message: "Please enable location in Settings", preferredStyle:    .alert) // can use alert or actionsheet.
                let act = UIAlertAction(title: "okay", style: .default,     handler: nil)
                art.addAction(act)
                present(art, animated: true, completion: nil)
                return
                
            case .authorizedAlways, .authorizedWhenInUse:
                break
        }
        locationM.delegate = self
        locationM.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // current location
        if let cl = locations.last {
            let lat = cl.coordinate.latitude
            let long = cl.coordinate.longitude
            
            let loc = CLLocationCoordinate2D(latitude: lat, longitude: long)
            let cs = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let rg = MKCoordinateRegion(center: loc, span: cs) // scale of map
            mpView.setRegion(rg, animated: true)
            
            ann.coordinate = loc
            ann.title = "Order"
            mpView.addAnnotation(ann)
        }
    }
    
    let locationM = CLLocationManager()
    
    @IBOutlet weak var mpView: MKMapView!


}
