//
//  Connectivity.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/24/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import UIKit
import Alamofire

class Connectivity: NSObject {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
