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
    
    
    
    @IBOutlet weak var emoji: UILabel!
    @IBOutlet weak var ipTFOut: UITextField!
    @IBOutlet weak var regionOut: UILabel!
    @IBOutlet weak var countryOut: UILabel!
    @IBOutlet weak var cityOut: UILabel!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        IpLocationNetworkService.getIpInfo(ip: "38.82.202.121") { (json) in
        let re = GetResponse(json: json)
            searchResults = SearchResults(dict: re.finalJsonFile)
            if searchResults != nil {
                self.emoji.text = searchResults?.emoji
                self.countryOut.text = searchResults?.country
                self.regionOut.text = searchResults?.region
                self.cityOut.text = searchResults?.city
            } else {
                self.showAlert(title: "Sorry!", message: "We can't find info about this ip adress!") {
                    
                }
            }
        }
        
        
        
     
        
    }
    
    
    @IBAction func searchBtnAct(_ sender: Any) {
        
        // подгружаем данне, вкидиваем картинки
        if ipTFOut.text != "" {
            
            // проверяем допустимые символы в айпи адресе
            let characterset = CharacterSet(charactersIn: " 0123456789.")
            if ipTFOut.text!.rangeOfCharacter(from: characterset.inverted) != nil {
                print("string contains special characters")
                
                
                return
            }
            ipTFOut.resignFirstResponder() // Убирает клавиатуру с view
            
            
            
        } else {
            
            self.showAlert(title: "Write IP Adress!", message: "") {
                
            }
        }
        
        
    }
    
    @IBAction func showMapAct(_ sender: Any) {
        
        
    }
    
    
}
