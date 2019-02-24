//
//  File.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/20/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import Foundation
import MaterialComponents.MaterialSnackbar

class SnackBarManager {
    static func snackBarWith(message : String) {
        let mes = MDCSnackbarMessage()
        mes.text = message
        MDCSnackbarManager.messageFont = UIFont(name: "HelveticaNeue-Bold", size: 25.0)
        MDCSnackbarManager.messageTextColor = UIColor.black
        MDCSnackbarManager.snackbarMessageViewBackgroundColor = UIColor.white
        MDCSnackbarManager.show(mes)
    }
}
