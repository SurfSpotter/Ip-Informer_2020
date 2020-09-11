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
    
  
// Это самый обобщенный сервис сетевой загрузки stage 1
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


    
    

   






















/*
 
 
       
         // Создаем метод для HTML запроса
         public func makeRequest(url: URL, headers: [String:String], completion: (Any) -> ()) {
             
             let request = NSMutableURLRequest(url: url)
             request.cachePolicy = .useProtocolCachePolicy
             request.timeoutInterval = 10.0
             request.allHTTPHeaderFields = headers
             
             let session = URLSession.shared
             session.dataTask(with: request as URLRequest) { (data, urlResponse, error) in
                 guard let data = data else {return}
                 
                 do { let json = try JSONSerialization.data(withJSONObject: data, options: []) }
                 catch {
                     print(error)
                 }
                 print("From NetworkService")
                 print(data)
             }.resume()
             
             
             
     }
     
     
     
     
 //// это старый код но рабочий
 let vc = UIViewController()
 
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
 
 /*   Не забудь обработать этот алерт!
 self.showAlert(title: "OOps", message: "Internal error or non-existent address")
 print(json["message"]!)
 
 */
 return
 }
 
 // создаем цикл
 for i in json {
 
 // безопасно вкидываем данне в переменные
 
 if i.key == "country" {
 if let country = i.value as? String
 {
 
 searchResults.country = country
 
 }
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
 
 
 
 
 // грузим фотку
 if i.key == "flag" {
 if let fg = i.value as? [String : Any]
 {if let imageFlagLink = fg["png"] as? String {
 //print(imageFlagLink)
 AF.request(imageFlagLink).response { (data) in
 
 // устанавливаем изображение
 //  self.imgOut.backgroundColor = .blue
 //  self.imgOut.contentMode = .scaleToFill
 searchResults.flag = UIImage(data: data.data!)
 // self.imgOut.image = self.searchResults.flag
 //self.imgOut.image = UIImage(data: data.data!)
 
 // после загрузки картинки заполняем все оутлеты
 //  self.refreshOutlets()
 }
 
 
 }
 
 // грузим эмодзи
 if let emojiFlag = fg["emoji"] as? String {
 // устанавливаем Emoji
 searchResults.emoji = emojiFlag
 }
 }
 }
 
 }
 // print(searchResults)
 }
 else {
 // выводим ошибку загрузки данных
 // print(resp.error?.errorDescription)
 
 /* Нe забудь обработать этот алерт!
 self.showAlert(title: "Network Error", message: "")
 
 */
 
 }
 }
 
 
 
 }
 }
 
 
 */
}
