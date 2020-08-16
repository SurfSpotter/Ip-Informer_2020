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
    @IBOutlet weak  var infoLabelMain: UILabel!
    @IBOutlet weak  var showMapButtonOut: UIButton!
    @IBOutlet weak  var countryLbl: UILabel!
    @IBOutlet weak  var regionLbl: UILabel!
    @IBOutlet weak  var cityLbl: UILabel!
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showUiElements(state: .hide)
       
    
    
  
    }
    
    @IBAction func searchBtnAct(_ sender: Any) {
        
        // подгружаем данне, вкидиваем картинки
        if ipTFOut.text != "" {
            
            // проверяем допустимые символы в айпи адресе
            let characterset = CharacterSet(charactersIn: " 0123456789.")
            if ipTFOut.text!.rangeOfCharacter(from: characterset.inverted) != nil {
                self.showUiElements(state: .hide)
                self.infoLabelMain.text = "You entered invalid characters"
                return
            }
            
            
            IpLocationNetworkService.getIpInfo(ip: ipTFOut.text!) { (json) in
                   let re = GetResponse(json: json)
                       searchResults = SearchResults(dict: re.finalJsonFile)
                       if searchResults != nil {
                           self.emoji.text = searchResults?.emoji
                           self.countryOut.text = searchResults?.country
                           self.regionOut.text = searchResults?.region
                           self.cityOut.text = searchResults?.city
                        self.infoLabelMain.text = "Success!"
                        self.showUiElements(state: .show)
                       } else {
                        
                        self.infoLabelMain.text = """
                        Sorry!
                        We can't find information
                        about this adress
                        😐
                        """
                        self.infoLabelMain.textAlignment = .center
                        self.showUiElements(state: .hide)
                        
                       }
                   }
            
            
            
            ipTFOut.resignFirstResponder() // Убирает клавиатуру с view
            
            
        } else {
            
            self.showAlert(title: "Write IP adress!", message: "") {
            self.infoLabelMain.text = "👇Write Ip adress here👇"
            self.showUiElements(state: .hide)
            }
        }

        
    }
    
    @IBAction func showMapAct(_ sender: Any) {
        
        
    }
    
   

    
    
    // Эта функция скрывает или показывает элементы UI
    func showUiElements(state: showOrHide) {
        
        switch state {
        case .hide :
        emoji.isHidden = true
        regionOut.isHidden = true
        countryOut.isHidden = true
        cityOut.isHidden = true
        showMapButtonOut.isHidden = true
        countryLbl.isHidden = true
        regionLbl.isHidden = true
        cityLbl.isHidden = true
            
            
        case .show :
            emoji.isHidden = false
            regionOut.isHidden = false
            countryOut.isHidden = false
            cityOut.isHidden = false
            showMapButtonOut.isHidden = false
            countryLbl.isHidden = false
            regionLbl.isHidden = false
            cityLbl.isHidden = false
        }
        
        
    }
}


