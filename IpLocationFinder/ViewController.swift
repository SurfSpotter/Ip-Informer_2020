//
//  ViewController.swift
//  IpLocationFinder
//
//  Created by Алексей Чигарских on 01.06.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
// Сделать текст филд для ввода адреса
// Сделать поля для вывода информации
// Сделатть кнопку для поиска
// Сделать кнопку "Показать на карте"
// Контроллер в который будут передаваться координаты
// Вью на которой будет карта и кнопка назад



import UIKit
import Alamofire


class ViewController: UIViewController {
    
    @IBOutlet weak var imgOut: UIImageView!
    @IBOutlet weak var emoji: UILabel!
    @IBOutlet weak var ipTFOut: UITextField!
    
    @IBOutlet weak var regionOut: UILabel!
    @IBOutlet weak var countryOut: UILabel!
    @IBOutlet weak var cityOut: UILabel!
    
    
    
    
    //  создаем структуру под  нужные данные
    struct SearchResults {
        var longitude : Double = 0.0
        var latitude : Double = 0.0
        var country :String = "none"
        var region : String = "none"
        var city: String = "none"
        var flag: UIImage? = nil
    }
    
    // создаем объект структуры
    var searchResults = SearchResults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            
            
           

        
        // подгружаем данне, вкидиваем картинки
        getRequest()
    }
    
    
    @IBAction func searchBtnAct(_ sender: Any) {
    }
    
    @IBAction func showMapAct(_ sender: Any) {
    }
    
    
    // Функция сетевой загрузки
    
    func getRequest() {
        
        // указываем Хедеры
        let headers : HTTPHeaders = [
            "x-rapidapi-host": "ip1.p.rapidapi.com",
            "x-rapidapi-key": "b83edcd79bmsh5d8e5afc777d064p163907jsn3d631587f634"
        ]
        
        // делаем запрос через Alamofire
        AF.request("https://ip1.p.rapidapi.com/188.242.12.164",headers: headers).responseJSON { (resp) in
            if resp.error == nil {
                guard let json = resp.value as? [String : Any] else { return }
                
                //   если пришел джейсон с сообщение то выводим его
                if json["message"] != nil {
                    print (json["message"]!)
                    // and alert пишем в неи ошибка загрузки данных
                    //  Если internal server error то скорее всего это неверный IP
                    self.showAlert(title: "Error", message: json["message"]! as! String)
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
                                self.imgOut.image = self.searchResults.flag
                                //self.imgOut.image = UIImage(data: data.data!)
                            }
                            
                            
                            }
                            
                            // грузим эмодзи
                            if let emojiFlag = fg["emoji"] as? String {
                                // устанавливаем Emoji
                                self.emoji.text = emojiFlag
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
    
    
    
    
    
    // функция показа алерта в случае ошибки
    func showAlert(title : String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

