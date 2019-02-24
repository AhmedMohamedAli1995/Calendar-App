//
//  RegisterService.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/20/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RegisterService: NSObject {
    
    
    class func signUp(url:String,user:User,completion:@escaping (_ error:Error?,_ array:Any)
        ->Void){
        
        let params = ["lang":"en",
                      "name":user.name,
                      "email":user.email,
                      "password":user.password,
                      "country_id":user.country_id,
                      "image":user.image] as [String : Any]
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
                    let result = try! decodr.decode(SignupRspons.self, from: jsonData)
                    if(Int(result.status ?? "0") != 1){
                        //show alert
                        print("show alert\(result)")
                        
                    }
                    else{
                        completion(nil, result.data?.id ?? 0)
                    }
                    break
                }
        }
    }
    
    
    class func getContries(url:String,completion:@escaping (_ error:Error?,_ array:Any)
        ->Void){
        
        let params = ["lang":"en"] as [String : Any]
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
                    let result = try! decodr.decode(CountriesResponse.self, from: jsonData)
                    completion(nil, result.data ?? [])
                    break
                }
        }
    }
}
