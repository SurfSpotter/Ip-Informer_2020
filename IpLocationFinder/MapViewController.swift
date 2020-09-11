//
//  MapViewController.swift
//  IpLocationFinder
//
//  Created by Алексей Чигарских on 02.06.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    

    @IBOutlet weak var mapViewOut: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let currentCoordinates = CurrentCoordinates()  // инициализируем переменную с содержащую координаты
        let ipCurrentLocation = CLLocationCoordinate2D(latitude: currentCoordinates.latitude, longitude: currentCoordinates.longitude)
        mapViewOut.setCenter(ipCurrentLocation, animated: true) // Устанавливаем центр на карте
        
        // Булавка на карте
        let annotation = MKPointAnnotation()
        annotation.coordinate = ipCurrentLocation
        mapViewOut.addAnnotation(annotation)
        
 */
    }
    

   

    @IBAction func dismissBtnAct(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
