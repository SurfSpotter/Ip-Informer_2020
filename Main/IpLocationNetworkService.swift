//
//  IpLocationNetworkService.swift
//  IpLocationFinder
//
//  Created by Алексей Чигарских on 28.07.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation
import Alamofire

public class IpLocationNetworkService {
    private init() {}
    
    static func getIpInfo(ip: String, completion: @escaping (Any) -> ()) {
        
        guard let url = URL(string: "https://ip1.p.rapidapi.com/" + ip )  else {
            print ("Wrong url from IpLocationNetworkService!" )
            return }
        print("url \(url)")
        //    создаем хедеры
        let headers = HTTPHeaders(["x-rapidapi-host": "ip1.p.rapidapi.com", "x-rapidapi-key": "b83edcd79bmsh5d8e5afc777d064p163907jsn3d631587f634"])
        
        NetworkService.shared.makeRequestWithAlamofire(url: url, headers: headers) { (json) in
            completion(json)
        }
        
    }
}
