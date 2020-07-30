//
//  ViewController.swift
//  IpLocationFinder
//
//  Created by Алексей Чигарских on 01.06.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
// Сделать текст филд для ввода адреса
// Сделать поля для вывода информации +
// Сделатть кнопку для поиска +
// Сделать кнопку "Показать на карте"
// Контроллер в который будут передаваться координаты
// Вью на которой будет карта и кнопка назад



import UIKit
import Alamofire



   

class MainViewController: UIViewController {
    
    
    
    @IBOutlet weak var imgOut: UIImageView!
    @IBOutlet weak var emoji: UILabel!
    @IBOutlet weak var ipTFOut: UITextField!
    @IBOutlet weak var regionOut: UILabel!
    @IBOutlet weak var countryOut: UILabel!
    @IBOutlet weak var cityOut: UILabel!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        IpLocationNetworkService.getIpInfo(ip: "72.203.226.94") { (json) in
        let re = GetResponse(json: json)
            searchResults = SearchResults(dict: re.finalJsonFile)
            
        }
        
       print("SR:")
        print(searchResults?.city)
        
        
        
//        NetworkService.shared.makeRequest(url: URL(string: "https://ip1.p.rapidapi.com/69.244.23.13")!,
//                                          headers: ["x-rapidapi-host": "ip1.p.rapidapi.com",
//                                                    "x-rapidapi-key": "b83edcd79bmsh5d8e5afc777d064p163907jsn3d631587f634"])
//        { (data) in
//                                                                                                                    data
//        }
//
        let headers = HTTPHeaders(["x-rapidapi-host": "ip1.p.rapidapi.com", "x-rapidapi-key": "b83edcd79bmsh5d8e5afc777d064p163907jsn3d631587f634"])
        
        NetworkService.shared.makeRequestWithAlamofire(url: URL(string: "https://ip1.p.rapidapi.com/69.244.23.13")!, headers: headers) { (data) in
            
        }
        
        ipTFOut.becomeFirstResponder() // показывает клавиатуру при запуске приложения
        
        
        
        
        
    }
    
    
    @IBAction func searchBtnAct(_ sender: Any) {
        
        // подгружаем данне, вкидиваем картинки
        if ipTFOut.text != "" {
            
            // проверяем допустимые символы в айпи адресе
            let characterset = CharacterSet(charactersIn: " 0123456789.")
            if ipTFOut.text!.rangeOfCharacter(from: characterset.inverted) != nil {
                print("string contains special characters")
                //showAlert(title: "IP adress not valid", message: "Please enter valid Ip adress")
                
                return
            }
            ipTFOut.resignFirstResponder() // Убирает клавиатуру с view
            //   NetRequest.share.getRequest(ip: ipTFOut.text!)  // Это функция сетевого слоя
            //   getRequest(ip: ipTFOut.text!)
            
            
        } else {
            
            self.showAlert(title: "Write IP Adress!", message: "") {
                
            }
        }
        
        
    }
    
    @IBAction func showMapAct(_ sender: Any) {
    }
    
    // Функция сетевой загрузки
    
    
    /*
     
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
     self.showAlert(title: "OOps", message: "Internal error or non-existent address") {}
     print(json["message"]!)
     return
     }
     
     // создаем цикл
     for i in json {
     
     // безопасно вкидываем данне в переменные
     
     if i.key == "country" {
     if let country = i.value as? String
     {
     searchResults.country = country}
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
     self.imgOut.backgroundColor = .blue
     self.imgOut.contentMode = .scaleToFill
     searchResults.flag = UIImage(data: data.data!)
     // self.imgOut.image = self.searchResults.flag
     //self.imgOut.image = UIImage(data: data.data!)
     
     // после загрузки картинки заполняем все оутлеты
     self.refreshOutlets()
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
     //self.showAlert(title: "Network Error", message: "", callback: () -> ())
     self.showAlert(title: "Network Error", message: "") {}
     }
     }
     
     
     
     }
     
     
     // функция заполения оутлетов
     
     func refreshOutlets() {
     regionOut.text = searchResults.region
     countryOut.text = searchResults.country
     cityOut.text = searchResults.city
     emoji.text = searchResults.emoji
     imgOut.image = searchResults.flag
     
     }
     
     
     //    // функция показа алерта в случае ошибки
     //    func showAlert(title : String, message: String) {
     //        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
     //        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
     //        alert.addAction(action)
     //        self.present(alert, animated: true, completion: nil)
     //    }
     
     }
     
     
     
     */
    
}
