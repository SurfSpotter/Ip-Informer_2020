//
//  IpLocationNetworkService.swift
//  IpLocationFinder
//
//  Created by Алексей Чигарских on 28.07.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation
import Alamofire

// этот класс уже  имеет конкретику под нашу задачу - URL, и обработчик Json, то есть структуру GetCommentResponse, это своеобразный мост между Сетевым сервисом и обработчиком JSON

public class IpLocationNetworkService {
    private init() {}
    
    
    
    static func getIpInfo(ip: String, completion: @escaping (Any) -> ()) {
    
        // создаем URL с учетом полученного IP
        guard let url = URL(string: "https://ip1.p.rapidapi.com/" + ip )  else {
            print ("Wrong url from IpLocationNetworkService!" )
            return }
        print("url \(url)")
        //    создаем хедеры
        let headers = HTTPHeaders(["x-rapidapi-host": "ip1.p.rapidapi.com", "x-rapidapi-key": "b83edcd79bmsh5d8e5afc777d064p163907jsn3d631587f634"])
        
        // вызываем метод с нужными нам параметрами
        NetworkService.shared.makeRequestWithAlamofire(url: url, headers: headers) { (json) in
            completion(json)
        }
        
    }
}
