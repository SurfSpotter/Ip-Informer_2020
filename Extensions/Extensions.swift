//
//  Extensions.swift
//  IpLocationFinder
//
//  Created by Алексей Чигарских on 10.06.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

  func showAlert(title: String, message: String, callback: @escaping () -> ()) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
     alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
       alertAction in
       callback()
     }))
     self.present(alert, animated: true, completion: nil)
   }

   
}
