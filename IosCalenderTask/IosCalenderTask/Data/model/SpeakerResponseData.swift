//
//  SpeakerResponseData.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/19/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import Foundation
struct SpeakerResponseData: Codable {
    let id: String?
    let name: String?
    let title: String?
    let type: String?
    let image: String?
    let bio: String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case title = "title"
        case type = "type"
        case image = "image"
        case bio = "bio"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        bio = try values.decodeIfPresent(String.self, forKey: .bio)
    }
    
}
