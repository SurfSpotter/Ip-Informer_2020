//
//  NetworkServices.swift
//  IpLocationFinder
//
//  Created by Алексей Чигарских on 10.06.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation
import Alamofire

/*


class NetRequest {
    static let share = NetRequest()
    // Функция сетевой загрузки
    func getRequest(ip: String) {
        
        //переменная хранения IP адреса
        let ipAdress: String = ip
        let urlStrWithAdress : String = "https://ip1.p.rapidapi.com/" + ipAdress
        
        
        // указываем Хедеры
        let headers : HTTPHeaders = [
            "x-rapidapi-host": "ip1.p.rapidapi.com",
            "x-rapidapi-key": "b83edcd79bmsh5d8e5afc777d064p163907jsn3d631587f634"
        ]
        
        
        
        // делаем запрос через Alamofire
        AF.request(urlStrWithAdress,headers: headers).responseJSON { (resp) in
            if resp.error == nil {
                guard let json = resp.value as? [String : Any] else { return }
                
                //   если пришел джейсон с сообщение то выводим его
                if json["message"] != nil {
                    print (json["message"]!)
                    // and alert пишем в неи ошибка загрузки данных
                    //  Если internal server error то скорее всего это неверный IP
                    self.showAlert(title: "OOps", message: "Internal error or non-existent address")
                    print(json["message"]!)
                    return
                }
                
                // создаем цикл
                for i in json {
                    
                    // безопасно вкидываем данне в переменные
                    
                    if i.key == "country" {
                        if let country = i.value as? String
                        {self.searchResults.country = country}
                    }
                    if i.key == "longitude" {
                        if let longitude = i.value as? Double
                        {self.searchResults.longitude = longitude}
                    }
                    if i.key == "latitude" {
                        if let latitude = i.value as? Double
                        {
                            self.searchResults.latitude = latitude
                        }
                    }
                    if i.key == "region" {
                        if let region = i.value as? String
                        {
                            self.searchResults.region = region
                        }
                    }
                    
                    if i.key == "city" {
                        if let city = i.value as? String
                        {
                            self.searchResults.city = city
                        }
                    }
                    
                   
                    
                    
                    // грузим фотку
                    if i.key == "flag" {
                        if let fg = i.value as? [String : Any]
                        {if let imageFlagLink = fg["png"] as? String {
                            //print(imageFlagLink)
                            AF.request(imageFlagLink).response { (data) in
                                
                                // устанавливаем изображение
                                self.imgOut.backgroundColor = .blue
                                self.imgOut.contentMode = .scaleToFill
                                self.searchResults.flag = UIImage(data: data.data!)
                               // self.imgOut.image = self.searchResults.flag
                                //self.imgOut.image = UIImage(data: data.data!)
                            
                                // после загрузки картинки заполняем все оутлеты
                               self.refreshOutlets()
                            }
                            
                            
                            }
                            
                            // грузим эмодзи
                            if let emojiFlag = fg["emoji"] as? String {
                                // устанавливаем Emoji
                                self.searchResults.emoji = emojiFlag
                            }
                        }
                    }
                    
                }
                // print(searchResults)
            }
            else {
                // выводим ошибку загрузки данных
                // print(resp.error?.errorDescription)
                self.showAlert(title: "Network Error", message: "")
                
            }
        }
        
        
        
    }
}

 */
