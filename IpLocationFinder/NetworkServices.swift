//
//  NetworkServices.swift
//  IpLocationFinder
//
//  Created by Алексей Чигарских on 10.06.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation
import Alamofire

public class NetworkService {
    private init() {}
    static let shared = NetworkService()
    
    // Принимает URL, Header, в completion передает данные типа [String:Any]
    public func makeRequestWithAlamofire(url: URL, headers: HTTPHeaders, completion: @escaping (Any) -> ()) {
        
        AF.request(url, headers: headers).responseJSON{ (response) in
            if response.error != nil {
                print(Errors.loadingFailed)
                return
            }
            guard let json = response.value as? [String : Any] else { return }
            completion(json)
        }
    }
}
