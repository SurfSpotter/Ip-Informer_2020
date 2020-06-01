//
//  ViewController.swift
//  IpLocationFinder
//
//  Created by Алексей Чигарских on 01.06.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       


        //  создаем структуру под данные
        struct SearchResults {
            var longitude : Double = 0.0
            var latitude : Double = 0.0
            var country :String = "none"
            var region : String = "none"
            var city: String = "none"
            var flag: UIImage? = nil
        }

        var searchResults = SearchResults()

        
        // указываем Хедеры
        let headers : HTTPHeaders = [
            "x-rapidapi-host": "ip1.p.rapidapi.com",
            "x-rapidapi-key": "b83edcd79bmsh5d8e5afc777d064p163907jsn3d631587f634"
        ]

// делаем запрост через Alamofire
        AF.request("https://ip1.p.rapidapi.com/188.242.12.164",headers: headers).responseJSON { (resp) in
            print(resp.value)
            guard let jsonArray = resp.value as? [String : Any] else { return }
            print (jsonArray.keys)
            
            
            
            
            
            // создаем цикл
            for i in jsonArray {
                
                if i.key == "country" {
                    if let country = i.value as? String
                    {searchResults.country = country}
                }
                if i.key == "longitude" {
                    if let longitude = i.value as? Double
                    {searchResults.longitude = longitude}
                }
                if i.key == "latitude" {
                    if let latitude = i.value as? Double
                    {
                        searchResults.latitude = latitude
                    }
                }
                if i.key == "region" {
                    if let region = i.value as? String
                    {
                        searchResults.region = region
                    }
                }
                
                if i.key == "city" {
                    if let city = i.value as? String
                    {
                        searchResults.city = city
                    }
                }
                if i.key == "flag" {
                    if let fg = i.value as? [String : Any]
                    {if let imageFlagLink = fg["svg"] {
                        print(imageFlagLink)
                       
                        }}
                }
               
            }
           // print(searchResults)
        }













    }


}

