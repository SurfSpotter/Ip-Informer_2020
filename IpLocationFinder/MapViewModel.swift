//
//  MapViewModel.swift
//  IpLocationFinder
//
//  Created by Алексей Чигарских on 15.08.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation




struct CurrentCoordinates {
    let latitude : Double
    let longitude : Double
    
    init() {
        if searchResults?.latitude != nil  && searchResults?.longitude  != nil  {
            self.latitude = searchResults!.latitude
            self.longitude = searchResults!.longitude
        } else {
            self.latitude = 0.00
            self.longitude = 0.00
        }
    }
}
