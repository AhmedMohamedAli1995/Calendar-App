

import Foundation
import UIKit

protocol BaseVCDelegate {
	func showActivityIndicator()
	func hideActivityIndicator()
	func showNoData(message: String)
    func hideNoData()
}



class BaseVC: UIViewController, BaseVCDelegate {

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		title = " "
		navigationController?.title = " "
		tabBarController?.title = " "
	}
	
	func showActivityIndicator() {
		HelperFunctions.displayActivityIndicator(in: view)
	}
	
	func hideActivityIndicator() {
		HelperFunctions.hideActivityIndicator(in: view)
	}
	
	func showNoData(message: String) {
		HelperFunctions.displayNoData(view: view, message: message)
	}
    
    func hideNoData() {
        HelperFunctions.hideNoData(view: view)
    }
	
	
}

class BaseTableVC: UITableViewController, BaseVCDelegate {
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		title = " "
		navigationController?.title = " "
		tabBarController?.title = " "
	}
	
	func showActivityIndicator() {
		HelperFunctions.displayActivityIndicator(in: view)
	}
	
	func hideActivityIndicator() {
        
		HelperFunctions.hideActivityIndicator(in: view)
	}
	
	func showNoData(message: String) {
		HelperFunctions.displayNoData(view: view, message: message)
	}
    
    func hideNoData() {
        HelperFunctions.hideNoData(view: view)
    }
	
	
	
	
	
}
