//
//  ViewController.swift
//  IpLocationFinder
//
//  Created by Алексей Чигарских on 01.06.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.




import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    
    
    @IBOutlet weak var ipTFOut: UITextField!
    @IBOutlet weak var regionOut: UILabel!
    @IBOutlet weak var countryOut: UILabel!
    @IBOutlet weak var cityOut: UILabel!
    @IBOutlet weak  var infoLabelMain: UILabel!
    @IBOutlet weak  var showMapButtonOut: UIButton!
    @IBOutlet weak  var searchButtonOut: UIButton!
    @IBOutlet weak  var countryLbl: UILabel!
    @IBOutlet weak  var regionLbl: UILabel!
    @IBOutlet weak  var cityLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showOrHideUiElements(state: .hide, elementsArray: arrayOfOutlets)
        
    }
    
    override func viewDidLayoutSubviews() {
       allAnchorsTurnOn()
    }
    
    @IBAction func showMapAct(_ sender: Any) {
        // переход выполнен в Storyboard
        
    }
    
 
    
   
    
    
    //MARK: - Logic
       
       fileprivate func requestWithLogic() {
           // подгружаем данне, вкидиваем картинки
           if ipTFOut.text != "" {
               
               // проверяем допустимые символы в айпи адресе
               let characterset = CharacterSet(charactersIn: " 0123456789.")
               if ipTFOut.text!.rangeOfCharacter(from: characterset.inverted) != nil {
                   self.showOrHideUiElements(state: .hide, elementsArray: arrayOfOutlets)
                   self.infoLabelMain.text = "🙅🏾‍♂️You entered invalid characters 🙅‍♀️"
                   return
               }
               
               // Сетевой запрос
               IpLocationNetworkService.getIpInfo(ip: ipTFOut.text!) { (json) in
                
                // сетевой запрос запихиваем в стурктуру которая обрабатывает запрос в нужный нам
                let response = GetResponse(json: json)
                searchResults = SearchResults(dict: response.finalJsonFile)
                if searchResults != nil {
                    self.countryOut.text = searchResults!.emoji + " " + searchResults!.country
                    self.regionOut.text = searchResults?.region
                    self.cityOut.text = searchResults?.city
                                       self.infoLabelMain.text = "🥳 Success! 🥳  "
                                       self.showOrHideUiElements(state: .show, elementsArray: self.arrayOfOutlets)
                                   } else {
                
                                       self.infoLabelMain.text = """
                                       Sorry, we did not find
                                       😐information about this address.😐
                                       """
                                       self.infoLabelMain.textAlignment = .center
                                       self.showOrHideUiElements(state: .hide, elementsArray: self.arrayOfOutlets)
                
                                   }
        
               }
               
               ipTFOut.resignFirstResponder() // Убирает клавиатуру с view
           } else {
               self.showAlert(title: "Write IP adress!", message: "") {
                   self.infoLabelMain.text = "👇Write Ip adress here👇"
                   self.showOrHideUiElements(state: .hide, elementsArray: self.arrayOfOutlets)
               }
           }
       }
       
       @IBAction func searchBtnAct(_ sender: Any) {
           
           requestWithLogic()
           
           
       }
    
    
    
    // MARK: - UIFunctions
    
    
    
    
    // Массив Outlets которые необходимо спрятать
    lazy var arrayOfOutlets: [AnyObject] = [countryOut, countryLbl, cityOut, cityLbl, regionOut, regionLbl, showMapButtonOut]
    
    // Эта функция скрывает или показывает элементы UI
    
    func showOrHideUiElements(state: showOrHide, elementsArray: [AnyObject] ) {
        
        switch state {
        case .hide :
            let _ =  arrayOfOutlets.map { (uiElement) in
                (uiElement as! UIView).isHidden = true
            }
            
        case .show :
            let _ =  arrayOfOutlets.map { (uiElement) in
                (uiElement as! UIView).isHidden = false
            }
        }
        
        
    }
    
    
    //MARK: - Constraints
    
    
    // Margins
    lazy var mView = view.layoutMarginsGuide
    
    func allAnchorsTurnOn() {
        anchorsShowMapButtonOut()
        anchorsInfoLabelMain()
        anchorsIpTFOut()
        anchorsIpsearchButtonOut()
        anchorCountryLbl()
        anchorCountryOut()
        anchorRegionLbl()
        anchorrRegionOut()
        anchorCityLbl()
        anchorCityOut()
    }
    
    
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
        infoLabelMain.adjustsFontSizeToFitWidth = true
    }
    
    func anchorsIpTFOut() {
        ipTFOut.translatesAutoresizingMaskIntoConstraints = false
        ipTFOut.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        ipTFOut.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        ipTFOut.topAnchor.constraint(equalTo: infoLabelMain.bottomAnchor, constant: 10.0).isActive = true
        ipTFOut.centerXAnchor.constraint(equalTo: mView.centerXAnchor).isActive = true
        ipTFOut.adjustsFontSizeToFitWidth = true
    }
    
    func anchorsIpsearchButtonOut() {
        searchButtonOut.translatesAutoresizingMaskIntoConstraints = false
        searchButtonOut.widthAnchor.constraint(equalTo: mView.widthAnchor, multiplier: 0.25).isActive = true
        searchButtonOut.heightAnchor.constraint(equalTo: searchButtonOut.widthAnchor).isActive = true
        searchButtonOut.topAnchor.constraint(equalTo: ipTFOut.bottomAnchor, constant: 10.0).isActive = true
        searchButtonOut.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    func anchorCountryLbl() {
        countryLbl.translatesAutoresizingMaskIntoConstraints = false
        countryLbl.widthAnchor.constraint(equalTo: mView.widthAnchor, multiplier: 1).isActive = true
        countryLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        countryLbl.topAnchor.constraint(equalTo: searchButtonOut.bottomAnchor, constant: 10.0).isActive = true
        countryLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        countryLbl.adjustsFontSizeToFitWidth = true
        countryLbl.textAlignment = .center
        
        
    }
    
    func anchorCountryOut() {
        countryOut.translatesAutoresizingMaskIntoConstraints = false
        countryOut.widthAnchor.constraint(equalTo: mView.widthAnchor, multiplier: 1).isActive = true
        countryOut.heightAnchor.constraint(equalToConstant: 27).isActive = true
        countryOut.topAnchor.constraint(equalTo: countryLbl.bottomAnchor, constant: 10.0).isActive = true
        countryOut.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        countryOut.adjustsFontSizeToFitWidth = true
        countryOut.textAlignment = .center
        
        
    }
    
    func anchorRegionLbl() {
        regionLbl.translatesAutoresizingMaskIntoConstraints = false
        regionLbl.widthAnchor.constraint(equalTo: mView.widthAnchor, multiplier: 1).isActive = true
        regionLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        regionLbl.topAnchor.constraint(equalTo: countryOut.bottomAnchor, constant: 10.0).isActive = true
        regionLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        regionLbl.adjustsFontSizeToFitWidth = true
        regionLbl.textAlignment = .center
        
    }
    
    func anchorrRegionOut() {
        regionOut.translatesAutoresizingMaskIntoConstraints = false
        regionOut.widthAnchor.constraint(equalTo: mView.widthAnchor, multiplier: 1).isActive = true
        regionOut.heightAnchor.constraint(equalToConstant: 27).isActive = true
        regionOut.topAnchor.constraint(equalTo: regionLbl.bottomAnchor, constant: 10.0).isActive = true
        regionOut.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        regionOut.adjustsFontSizeToFitWidth = true
        regionOut.textAlignment = .center
        
        
    }
    
    
    func anchorCityLbl() {
        cityLbl.translatesAutoresizingMaskIntoConstraints = false
        cityLbl.widthAnchor.constraint(equalTo: mView.widthAnchor, multiplier: 1).isActive = true
        cityLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cityLbl.topAnchor.constraint(equalTo: regionOut.bottomAnchor, constant: 10.0).isActive = true
        cityLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityLbl.adjustsFontSizeToFitWidth = true
        cityLbl.textAlignment = .center
        
        
    }
    
    func anchorCityOut() {
        cityOut.translatesAutoresizingMaskIntoConstraints = false
        cityOut.widthAnchor.constraint(equalTo: mView.widthAnchor, multiplier: 1).isActive = true
        cityOut.heightAnchor.constraint(equalToConstant: 27).isActive = true
        cityOut.topAnchor.constraint(equalTo: cityLbl.bottomAnchor, constant: 10.0).isActive = true
        cityOut.bottomAnchor.constraint(greaterThanOrEqualTo: showMapButtonOut.topAnchor, constant: -10.00).isActive = false
        cityOut.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityOut.adjustsFontSizeToFitWidth = true
        cityOut.textAlignment = .center
        
        
    }
    
}


