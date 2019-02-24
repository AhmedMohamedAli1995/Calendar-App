//
//  SpeakerCell.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/20/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import UIKit

class SpeakerCell: UITableViewCell {

    @IBOutlet weak var speakerCompany: UILabel!
    @IBOutlet weak var speakerTitle: UILabel!
    @IBOutlet weak var speakerName: UILabel!
    @IBOutlet weak var speakerImage: UIImageView!{
        didSet{
            speakerImage.layer.cornerRadius = speakerImage.frame.size.height / 2
            speakerImage.clipsToBounds = true
        }
    }
    
}
