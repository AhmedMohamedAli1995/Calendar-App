//
//  AgendaDetails.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/18/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import Foundation
struct AgendaInnerData: Codable {
    let id: String?
    let title: String?
    let time_from: String?
    let time_to: String?
    let track_id: String?
    var adddedtocalender: String?
    let date: String?
    
    

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case time_from = "time_from"
        case time_to = "time_to"
        case title = "title"
        case track_id = "track_id"
        case adddedtocalender = "adddedtocalender"
        case date = "date"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        time_from = try values.decodeIfPresent(String.self, forKey: .time_from)
        time_to = try values.decodeIfPresent(String.self, forKey: .time_to)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        track_id = try values.decodeIfPresent(String.self, forKey: .track_id)
        adddedtocalender = try values.decodeIfPresent(String.self, forKey: .adddedtocalender)
    }
    
}
