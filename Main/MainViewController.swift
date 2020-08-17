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



   

@IBDesignable class MainViewController: UIViewController {
    
    
    
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
        
       // showUiElements(state: .hide)
       
anchorsShowMapButtonOut()
anchorsInfoLabelMain()
anchorsipTFOut()
    
  
    }
    
    @IBAction func searchBtnAct(_ sender: Any) {
        
        // подгружаем данне, вкидиваем картинки
        if ipTFOut.text != "" {
            
            // проверяем допустимые символы в айпи адресе
            let characterset = CharacterSet(charactersIn: " 0123456789.")
            if ipTFOut.text!.rangeOfCharacter(from: characterset.inverted) != nil {
                self.showUiElements(state: .hide)
                self.infoLabelMain.text = "🙅🏾‍♂️You entered invalid characters 🙅‍♀️"
                return
            }
            
            // Сетевой запрос
            IpLocationNetworkService.getIpInfo(ip: ipTFOut.text!) { (json) in
                   let re = GetResponse(json: json)
                       searchResults = SearchResults(dict: re.finalJsonFile)
                       if searchResults != nil {
                        self.countryOut.text = searchResults!.emoji + " " + searchResults!.country
                        self.regionOut.text = searchResults?.region
                        self.cityOut.text = searchResults?.city
                        self.infoLabelMain.text = "🥳 Success! 🥳  "
                        self.showUiElements(state: .show)
                       } else {
                        
                        self.infoLabelMain.text = """
                        
                        Sorry, we did not find
                        information about this address.
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
        // переход выполнен в Storyboard
        
    }
    
   

    
    
    // Эта функция скрывает или показывает элементы UI
    func showUiElements(state: showOrHide) {
        
        switch state {
        case .hide :
        regionOut.isHidden = true
        countryOut.isHidden = true
        cityOut.isHidden = true
        showMapButtonOut.isHidden = true
        countryLbl.isHidden = true
        regionLbl.isHidden = true
        cityLbl.isHidden = true
            
            
        case .show :
           
            regionOut.isHidden = false
            countryOut.isHidden = false
            cityOut.isHidden = false
            showMapButtonOut.isHidden = false
            countryLbl.isHidden = false
            regionLbl.isHidden = false
            cityLbl.isHidden = false
        }
        
        
    }
    
    
    //MARK: - Constraints
 
    lazy var mView = view.layoutMarginsGuide
    
    func anchorsShowMapButtonOut() {
        showMapButtonOut.translatesAutoresizingMaskIntoConstraints = false
        showMapButtonOut.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45).isActive = true
        showMapButtonOut.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        showMapButtonOut.bottomAnchor.constraint(equalTo: mView.bottomAnchor, constant: -30.0).isActive = true
        showMapButtonOut.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func anchorsInfoLabelMain() {
        infoLabelMain.translatesAutoresizingMaskIntoConstraints = false
        infoLabelMain.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        infoLabelMain.heightAnchor.constraint(equalTo: mView.heightAnchor, multiplier: 0.15 ).isActive = true
        infoLabelMain.topAnchor.constraint(equalTo: mView.topAnchor, constant: 10.0).isActive = true
        infoLabelMain.centerXAnchor.constraint(equalTo: mView.centerXAnchor).isActive = true
        infoLabelMain.backgroundColor = .blue
        infoLabelMain.adjustsFontSizeToFitWidth = true
    }
    
    func anchorsipTFOut() {
           ipTFOut.translatesAutoresizingMaskIntoConstraints = false
           ipTFOut.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        ipTFOut.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        ipTFOut.topAnchor.constraint(equalTo: infoLabelMain.bottomAnchor, constant: 10.0).isActive = true
           ipTFOut.centerXAnchor.constraint(equalTo: mView.centerXAnchor).isActive = true
           ipTFOut.backgroundColor = .blue
           ipTFOut.adjustsFontSizeToFitWidth = true
       }
    
}


