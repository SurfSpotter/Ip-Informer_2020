//
//  Model.swift
//  IpLocationFinder
//
//  Created by Алексей Чигарских on 08.07.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation
import UIKit

//  создаем структуру под  нужные данные
struct SearchResults {
       var longitude : Double = 0.0
       var latitude : Double = 0.0
       var country :String = "none"
       var region : String = "none"
       var city: String = "none"
       var flag: UIImage? = nil
       var emoji: String = ""
    
    init () {}
    
    init? (dict: [String:AnyObject]) {
        guard let latitude = dict["latitude"] as? Double,
        let longitude = dict["longitude"] as? Double,
        let country = dict["country"] as? String,
        let region = dict["region"] as? String,
        let city = dict["city"] as? String,
        let emoji = dict["emoji"] as? String
            else {return nil}
        //
        self.latitude = latitude
        self.longitude = longitude
        self.country = country
        self.region = region
        self.city = city
        //self.flag = dict["flag"] as! UIImage
        self.emoji = emoji
    }
   }
   
  
 
enum showOrHide {
    case  show
    case  hide
}
