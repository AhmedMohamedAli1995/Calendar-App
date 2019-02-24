//
//  CalenderDetailsVC.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/20/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: BaseVC, DetailsDelegate {
    
    @IBOutlet weak var speakersTableView: UITableView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var dateOutllet: UILabel!
    @IBOutlet weak var timeOutlet: UILabel!
    @IBOutlet weak var addToCalender: UIStackView!
    
    @IBOutlet weak var addLabel: UILabel!
    @IBOutlet weak var addOutlet: UIButton!
    @IBAction func addAction(_ sender: Any) {
        if Int(agendaObject!.adddedtocalender!) == 1 {
            selectedCell!.removeFromCalender()
            agendaObject!.adddedtocalender! = "0"
        }else{
            selectedCell!.addToCalender()
            agendaObject!.adddedtocalender! = "1"
        }
        DispatchQueue.main.async {
            self.setUpAddBTN()
        }
    }
    
    var detailsPresenter : DetailsVCPresenter?
    var agendaObject: AgendaInnerData?
    var speakers = Array<SpeakerResponseData>()
    var selectedCell : CalenderCell?
    override func viewDidLoad() {
        super.viewDidLoad()
        speakersTableView.delegate = self
        speakersTableView.dataSource = self
        registerCell()
        detailsPresenter = DetailsVCPresenter(view: self)
        detailsPresenter?.getSpeakers(agendaId: agendaObject?.id ?? "1")
        initalization()
    }
    
    @objc func stackTapped() {
        if Int(agendaObject!.adddedtocalender!) == 1 {
            selectedCell!.removeFromCalender()
            agendaObject!.adddedtocalender! = "0"
        }else{
            selectedCell!.addToCalender()
            agendaObject!.adddedtocalender! = "1"
        }
        DispatchQueue.main.async {
            self.setUpAddBTN()
        }
    }
    
    func initalization(){
        timeOutlet.text = selectedCell?.setupTime()
        eventTitle.text = agendaObject?.title
        selectedCell?.addTapGesture(stackView: addToCalender, target: self, action: #selector(stackTapped))
        addLabel.text = selectedCell?.calenderAddLabel.text
        addOutlet.setImage(selectedCell?.calenderAddButton.imageView?.image, for: .normal)
        dateOutllet.text = agendaObject?.date
    }
    
    func setUpAddBTN() {
        if Int(agendaObject!.adddedtocalender!) == 1 {
            self.addLabel.text = "Added to calendar"
            if let image = UIImage(named: "doneicon") {
                self.addOutlet.setImage(image, for: .normal)
            }
        }else{
            self.addLabel.text = "Add to calendar"
            if let image = UIImage(named: "addicon") {
                self.addOutlet.setImage(image, for: .normal)
            }
        }
    }
    
    func registerCell() {
        let cellNib = UINib(nibName: "SpeakerCell", bundle: nil)
        speakersTableView.register(cellNib, forCellReuseIdentifier:"SpeakerCell")
    }
    
    func setSpeakers(speakers: [SpeakerResponseData]) {
        self.speakers = speakers
        speakersTableView.reloadData()
    }
}

extension DetailsViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speakers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpeakerCell", for: indexPath) as! SpeakerCell
        cell.speakerImage.sd_setImage(with: URL(string: speakers[indexPath.row].image!), placeholderImage: UIImage(named: "man"))
        cell.speakerName.text = speakers[indexPath.row].name
        let title = getTitleAndCompany(string: speakers[indexPath.row].title!)
        cell.speakerTitle.text = title.0
        cell.speakerCompany.text = title.1
        return cell
    }
    
    func getTitleAndCompany(string:String) -> (String,String) {
        var splitedText = string.split(separator: ",")
        if string.contains(",") {
          return (String(splitedText[0]), String(splitedText[1]))
        }
        else{
        return (String(splitedText[0]), " ")
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Speakers"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white.withAlphaComponent(1)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.blue
    }
    
}
