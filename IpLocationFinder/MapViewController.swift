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

       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func dismissBtnAct(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
