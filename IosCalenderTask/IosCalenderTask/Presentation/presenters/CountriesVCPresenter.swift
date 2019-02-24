//
//  CountriesVCPresenter.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/24/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import Foundation
import UIKit
class CountriesVCPresenter: NSObject {
    var countriesNames:[String] = []
    private var view: BaseVCDelegate & CountriesDelegate
    required init(view: BaseVCDelegate & CountriesDelegate) {
        self.view = view
    }
    func getCountries() {
        view.showActivityIndicator()
        if Connectivity.isConnectedToInternet{
        RegisterService.getContries(url: URLs.contriesURL.rawValue) { (error :Error?, arr : Any) in
            if error == nil {
               
               let  countries = arr as! [CountriesResponseData]
                for country in countries{
                    self.countriesNames.append(country.name!)
                }
                self.view.setContries(data:countries,names: self.countriesNames)
                self.view.hideActivityIndicator()
                if countries.count == 0 {
                    self.view.showNoData(message: "No Speakers Yet")
                }
            }
            else {
                print("error")
            }
            
        }
    }
    else{
        self.view.hideActivityIndicator()
        HelperFunctions.showAlert(message: "Please check your internet connection ", title:"Sorry")
        }
    }
}
