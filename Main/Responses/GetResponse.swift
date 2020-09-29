//
//  GetResponse.swift
//  IpLocationFinder
//
//  Created by Алексей Чигарских on 28.07.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation

struct GetResponse {
    var finalJsonFile:[String:AnyObject] = [:]
    
    init(json: Any) {
        
        var jsonConvert = json as! [String:AnyObject]
        var jsonFlags:[String:AnyObject] = [:]
        
        // Если есть какие либо косяки с правильностью IP, то выводиться сообщение
        if jsonConvert["message"] != nil {
            
            return
        }
        
        for i in jsonConvert {
            if i.key == "flag" {
                let arrFlags:[String:AnyObject] = i.value as! [String : AnyObject]
                jsonFlags = arrFlags
            }
        }
        jsonConvert["emoji"] = jsonFlags["emoji"]
        finalJsonFile = jsonConvert
        
        
    }
    
}
