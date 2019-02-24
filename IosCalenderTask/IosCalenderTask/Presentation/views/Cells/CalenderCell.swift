//
//  CalenderCell.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/17/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import Foundation
import UIKit
class CalenderCell: UITableViewCell {
    @IBOutlet weak var calenderTitle: UILabel!
    @IBOutlet weak var calenderDay: UILabel!
    @IBOutlet weak var calenderMonth: UILabel!
    @IBOutlet weak var calenderTime: UILabel!
    @IBOutlet weak var addToMyCalender: UIStackView!
    @IBOutlet weak var topSepareator: UIView!
    @IBOutlet weak var timeLineDot: UIView!
    @IBOutlet weak var messageArrow: UIImageView!
    @IBOutlet weak var calenderAddLabel: UILabel!
    @IBOutlet weak var calenderAddButton: UIButton!
    var indx : Int?
    var isFirstCell = false
    var agendaData:AgendaData?
    var isAdded = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addTapGesture(stackView: addToMyCalender, target: self,action: #selector(stackViewTapped))
    }
    
    func configureCell() {
        calenderTitle.text = agendaData?.data![indx!].title
        setupDate()
        calenderTime.text = setupTime()
        setUpAddBTN()
    }
    
    func setUpAddBTN() {
        if Int(agendaData!.data![indx!].adddedtocalender!) == 1 {
            self.calenderAddLabel.text = "Added to calendar"
            if let image = UIImage(named: "doneicon") {
                self.calenderAddButton.setImage(image, for: .normal)
            }
        }else{
            self.calenderAddLabel.text = "Add to calendar"
            if let image = UIImage(named: "addicon") {
                self.calenderAddButton.setImage(image, for: .normal)
            }
        }
    }
    
    func show() {
        if isFirstCell {
            topSepareator.isHidden = true
        }
        timeLineDot.isHidden = false
        messageArrow.isHidden = false
        calenderDay.isHidden = false
        calenderMonth.isHidden = false
    }
    
    func hide() {
        topSepareator.isHidden = false
        timeLineDot.isHidden = true
        messageArrow.isHidden = true
        calenderDay.isHidden = true
        calenderMonth.isHidden = true
        
    }
    func addTapGesture(stackView: UIStackView,target: Any  ,action: Selector){
      let tap = UITapGestureRecognizer(target: target, action: action)
      stackView.addGestureRecognizer(tap)
      stackView.isUserInteractionEnabled = true
    }
    // function which is triggered when stackViewTapped is called
    @objc
    func stackViewTapped(_ sender: UITapGestureRecognizer) {
        if Int(agendaData!.data![indx!].adddedtocalender!) == 1 {
            removeFromCalender()
        }else{
            addToCalender()
        }
    }
    
    func addToCalender(){
        HomeService.updateClandar(url: URLs.updateCalender.rawValue, addedToCalandar: "1", agendaId: agendaData!.data![indx!].id!, completion: { (error :Error?, arr : Any) in
            if error == nil{
                self.agendaData!.data![self.indx!].adddedtocalender = "1"
                DispatchQueue.main.async {
                    self.setUpAddBTN()
                }
            }
            })
    }
    
    func removeFromCalender(){
        HomeService.updateClandar(url: URLs.updateCalender.rawValue, addedToCalandar: "0", agendaId: agendaData!.data![indx!].id!, completion: { (error :Error?, arr : Any) in
            if error == nil{
                self.agendaData!.data![self.indx!].adddedtocalender = "0"
                DispatchQueue.main.async {
                    self.setUpAddBTN()
                }
            }
        })
    }
    
    func setupDate(){
        var fulldateArr = agendaData?.data![indx!].date!.split() {$0 == "-"}.map(String.init)
        let actualMonth:Int = Int(fulldateArr![1])!
        let aculalDay:Int = Int(fulldateArr![2])!
        calenderMonth.text = String(describing: Months(rawValue: actualMonth)!)
        calenderDay.text =  String(describing: aculalDay)
    }
    
    func setupTime()->String{
        var timeFrom = ""
        var timeTo = ""
        let fullTimeFrom = agendaData?.data![indx!].time_from!.split() {$0 == ":"}.map(String.init)
        let fullTimeTo = agendaData?.data![indx!].time_to!.split() {$0 == ":"}.map(String.init)
        let actualFromHour = Int(fullTimeFrom![0])!
        let actualToHour = Int(fullTimeTo![0])!
        
        if(actualFromHour > 12){
            timeFrom = String(describing: agendaData!.data![indx!].time_from!)+" Pm"
        }
        if(actualFromHour < 12 ){
            timeFrom = String(describing: agendaData!.data![indx!].time_from!)+" Am"
        }
        if(actualFromHour == 12){
            timeFrom = String(describing: agendaData!.data![indx!].time_from!)+" Pm"
            
        }
        if(actualFromHour == 24){
            timeFrom = String(describing: agendaData!.data![indx!].time_from!)+" Am"
        }
        /////////
        if(actualToHour > 12){
            timeTo = String(describing: agendaData!.data![indx!].time_to!)+" Pm"
        }
        if(actualToHour < 12 ){
            timeTo = String(describing: agendaData!.data![indx!].time_to!)+" Am"
        }
        if(actualToHour == 12){
            timeTo = String(describing: agendaData!.data![indx!].time_to!)+" Pm"
        }
        if(actualToHour == 24){
            timeTo = String(describing: agendaData!.data![indx!].time_to!)+" Am"
        }
        return String(describing: timeFrom+" - "+timeTo)
    }
  
    
    @IBAction func addToCalenderAction(_ sender: Any) {
        if Int(agendaData!.data![indx!].adddedtocalender!) == 1 {
            removeFromCalender()
        }else{
            addToCalender()
        }
    }
}
