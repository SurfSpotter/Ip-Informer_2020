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
        
    }
    
    //MARK: - Logic
    
    fileprivate func requestWithLogic() {
        // подгружаем данне, вкидиваем картинки
        if ipTFOut.text != "" {
            let textFieldWithfixComma = ipTFOut.text!.replacingOccurrences(of: ",", with: ".") // заменяем запятую на точку
            // проверяем допустимые символы в айпи адресе
            let characterset = CharacterSet(charactersIn: " 0123456789.")
            if textFieldWithfixComma.rangeOfCharacter(from: characterset.inverted) != nil {
                self.showOrHideUiElements(state: .hide, elementsArray: arrayOfOutlets)
                self.infoLabelMain.text = "🙅🏾‍♂️You entered invalid characters 🙅‍♀️"
                return
            }
            
            // Сетевой запрос
            
            IpLocationNetworkService.getIpInfo(ip: textFieldWithfixComma) { (json) in
                
                let response = GetResponse(json: json)
                searchResults = SearchResults(dict: response.finalJsonFile)
                if searchResults != nil {
                    self.countryOut.text = searchResults?.country
                    // это ветвление сделано для того чтобы подставить вместо "" "-"
                    if searchResults?.region != "" {
                        self.regionOut.text = searchResults?.region
                    } else { self.regionOut.text = "-"}
                    if searchResults?.city != "" {
                        self.cityOut.text = searchResults?.city
                    } else { self.cityOut.text = "-"}
                    self.infoLabelMain.text = "🥳 Success! 🥳  "
                    self.showOrHideUiElements(state: .show, elementsArray: self.arrayOfOutlets)
                } else {
                    
                    self.infoLabelMain.text = """
                    Sorry, we did not find
                    😐information about this address.😐
                    """
                    self.infoLabelMain.textAlignment = .center
                    self.showOrHideUiElements(state: .hide, elementsArray: self.arrayOfOutlets)
                    
                }}
            
            ipTFOut.resignFirstResponder()
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
    
    // Outlets to hide
    lazy var arrayOfOutlets: [AnyObject] = [countryOut, countryLbl, cityOut, cityLbl, regionOut, regionLbl, showMapButtonOut]
    
    // Show or Hide UIElements
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
    
    // Margins
    lazy var mView = view.layoutMarginsGuide
    
}


