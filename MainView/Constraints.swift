//
//  Constraints.swift
//  IpLocationFinder
//
//  Created by Алексей Чигарских on 29.09.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

extension MainViewController {
    
    //MARK: - Constraints
    
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
