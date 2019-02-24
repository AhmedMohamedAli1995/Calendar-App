//
//  SpeakersService.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/20/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class SpeakersService: NSObject {
    
    
    class func getSpeakers(url:String,agendaId:String,completion:@escaping (_ error:Error?,_ array:Any)
        ->Void){
        let params = ["agenda_id":agendaId,"lang":"en"] as [String : Any]
        Alamofire.request(url, method:.post, parameters: params, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result{
                case.failure(let error):
                    completion(error,false)
                    print(error)
                    break
                case.success(let value):
                    let json = JSON(value)
                    let string = String(describing: json)
                    let jsonData = string.data(using: .utf8)!
                    let decodr = JSONDecoder()
                    let result = try! decodr.decode(SpeakerResponse.self, from: jsonData)
                    completion(nil, result)
                    break
                }
        }
    }
}
