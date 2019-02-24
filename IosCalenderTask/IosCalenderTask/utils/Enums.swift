//
//  URLs.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/18/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import Foundation

enum URLs : String{
    case calenderURL = "http://166.62.117.167/Comesa_app/mobileApp/getAgenda.php"
    case updateCalender = "http://166.62.117.167/Comesa_app/mobileApp/addToCalendar.php"
    case speakerURL = "http://166.62.117.167/Comesa_app/mobileApp/getAgendaSpeakers.php"
    case registerURL = "http://166.62.117.167/Comesa_app/mobileApp/signup.php"
    case contriesURL = "http://166.62.117.167/Comesa_app/mobileApp/getCountriesList.php"
}

enum Months: Int  {
    case January=1, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
    var month : String {
        return String(describing: self)
    }

}
enum Keys : String{
    case clientId = "clientId"
    case isRegister = "isRegster"
}




