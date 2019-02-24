//
//  File.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/20/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import Foundation

class Validation {
    
    static func isValidEmail(enteredEmail:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
    
    static func isPasswordValid(_ password : String) -> Bool{
        // from 6 to 15 any chars
        let passFormat = "[A-Za-z0-9-@#$%&*ˆ+=_]{6,17}"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passFormat)
        return passwordPredicate.evaluate(with: password)
    }
    static func isEmbity(str : String) -> Bool {
        if str == "" {
            return true
        }else{
            return false
        }
    }
}
