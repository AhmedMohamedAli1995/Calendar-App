//
//  HomeService.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/17/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeService: NSObject {
    
    class func getCalanders(url:String,completion:@escaping (_ error:Error?,_ array:Any)
        ->Void){
        
        let params = ["user_id":"\(HelperFunctions.getUserId())","lang":"en"] as [String : Any]
        
       
        Alamofire.request(url, method:.post, parameters: params, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case.failure(let error):
                    completion(error,false)
                    print(error)
                    break
                case.success(let value):
                    let json = JSON(value)
                    let string = String(describing: json)
                    let jsonData = string.data(using: .utf8)!
                    let decodr = JSONDecoder()
                    let result = try! decodr.decode(AgendaResponse.self, from: jsonData)
                    if result.status == "1" {
                        completion(nil, result.data ?? [])
                    }
                    break
                }
         }
       
    }
    class func updateClandar(url: String, addedToCalandar: String,agendaId: String ,completion:@escaping (_ error:Error?,_ array:Any)
        ->Void){
        let params = ["agenda_id":agendaId,
                      "adddedtocalender":addedToCalandar,
                      "lang":"en",
                      "user_id":1] as [String : Any]
        Alamofire.request(url, method:.post, parameters: params, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case.failure(let error):
                    completion(error,false)
                    print(error)
                    break
                case.success(_):
                    
                    completion(nil,true)
                    break
                }
        }
    }
        
}


