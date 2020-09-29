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
   }
   
   // создаем объект структуры
   var searchResults = SearchResults()
 
