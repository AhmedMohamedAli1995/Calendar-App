//
//  ViewController.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/17/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import UIKit

class EventCalendar: BaseVC, HomeDelegate {
    
    var calenderArr = [AgendaData]()
    var homePresenter : HomeVCPersenter?
    
    @IBOutlet weak var calanderTable: UITableView!
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(refrshTorequestData),
                                 for: .valueChanged)
        refreshControl.tintColor = UIColor.gray
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configNavigationBar()
        registerCell()
        homePresenter = HomeVCPersenter(view: self)
        homePresenter!.getHomeCalenders()

    }
    
    func configNavigationBar(){
        self.title = "Agnda"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.blue]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
         calanderTable.refreshControl = refreshControl
    }
    

    func registerCell() {
        let cellNib = UINib(nibName: "CalenderCell", bundle: nil)
        calanderTable.register(cellNib, forCellReuseIdentifier:"calendarCell")
    }
    
    func setCalender(calenderData: [AgendaData]) {
        calenderArr = calenderData
        calanderTable.reloadData()
       
    }
    @objc func refrshTorequestData(){
         homePresenter!.getHomeCalenders()
         calanderTable.reloadData()
        self.refreshControl.endRefreshing()
    }

}

extension EventCalendar: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return calenderArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calenderArr[section].data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CalenderCell
        navToDetails(obj: calenderArr[indexPath.section].data![indexPath.row], cell: cell)
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell", for: indexPath) as! CalenderCell
        cell.indx = indexPath.row
        
        if indexPath.row == 0 && indexPath.section == 0{
            cell.isFirstCell = true
        }
        if indexPath.row == 0 {
            cell.show()
        }else{
            cell.isFirstCell = false
            cell.hide()
        }
        cell.agendaData = calenderArr[indexPath.section]
        cell.configureCell()
        return cell
    }
    
    func navToDetails(obj:AgendaInnerData, cell: CalenderCell) {
        print("AhmedAli")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.agendaObject = obj
        vc.selectedCell = cell
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
