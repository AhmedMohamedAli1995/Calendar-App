//
//  HomeVCPresenter.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/17/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import Foundation
import UIKit

class HomeVCPersenter: NSObject {
    
    private var view: BaseVCDelegate & HomeDelegate
    required init(view: BaseVCDelegate & HomeDelegate) {
        self.view = view
    }
    
    func getHomeCalenders() {
        view.showActivityIndicator()
        if Connectivity.isConnectedToInternet {
        HomeService.getCalanders(url: URLs.calenderURL.rawValue) { (error :Error?, arr : Any) in
            if error == nil {
                self.view.setCalender(calenderData: arr as! [AgendaData])
                self.view.hideActivityIndicator()
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
