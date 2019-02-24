//
//  SpeakerResponse.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/19/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import UIKit
import Foundation
struct SpeakerResponse: Codable {
    let messageText : String?
    let status : String?
    let data : [SpeakerResponseData]?
    
    enum CodingKeys: String, CodingKey {
        
        case messageText = "MessageText"
        case status = "status"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        messageText = try values.decodeIfPresent(String.self, forKey: .messageText)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        data = try values.decodeIfPresent([SpeakerResponseData].self, forKey: .data)
    }
    
}
