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
    // У нас есть структура, мы этой стуктуре хотим скормить правильный формат данных, ведь флаги и нас вложены и ключa "emoji" в корневом Json Нету
    init(json: Any) {
        
        var jsonConvert = json as! [String:AnyObject]
        var jsonFlags:[String:AnyObject] = [:]
        
        for i in jsonConvert {
            if i.key == "flag" {
                
                let arrFlags:[String:AnyObject] = i.value as! [String : AnyObject]
                jsonFlags = arrFlags
                
                
            }
        }
        jsonConvert["emoji"] = jsonFlags["emoji"]
        finalJsonFile = jsonConvert
        print(jsonConvert["emoji"])
    
    }
   
}
