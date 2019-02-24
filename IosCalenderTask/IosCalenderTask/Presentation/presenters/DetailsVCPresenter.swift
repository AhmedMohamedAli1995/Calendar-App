//
//  DetailsVCPresenter.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/17/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//
import Foundation
import UIKit
class DetailsVCPresenter: NSObject {
    
    private var view: BaseVCDelegate & DetailsDelegate
    required init(view: BaseVCDelegate & DetailsDelegate) {
        self.view = view
    }
    
    func getSpeakers(agendaId:String) {
        view.showActivityIndicator()
        if Connectivity.isConnectedToInternet{
        SpeakersService.getSpeakers(url: URLs.speakerURL.rawValue, agendaId: agendaId) { (error :Error?, arr : Any) in
            if error == nil {
                let speakers = arr as! SpeakerResponse
                self.view.setSpeakers(speakers: speakers.data ?? [])
                self.view.hideActivityIndicator()
                if speakers.data?.count == 0 {
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
