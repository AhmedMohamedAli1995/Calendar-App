

import Foundation
import UIKit
class HelperFunctions {
    private static let  def = UserDefaults.standard
	private static var activityIndicator = UIActivityIndicatorView(style: .gray)
	private static var noDataLbl = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    

	
	class func displayActivityIndicator(in view: UIView, offset: CGFloat = 0) {
		
		activityIndicator.center = CGPoint(x: view.center.x, y: view.center.y + offset)
		view.addSubview(activityIndicator)
        view.bringSubviewToFront(activityIndicator)
		activityIndicator.isHidden = false
		activityIndicator.startAnimating()
        
        if !UIApplication.shared.isIgnoringInteractionEvents {
            UIApplication.shared.beginIgnoringInteractionEvents()
        }
	}
	
	class func hideActivityIndicator(in view: UIView) {
        
		activityIndicator.stopAnimating()
		activityIndicator.isHidden = true
		activityIndicator.removeFromSuperview()
		UIApplication.shared.endIgnoringInteractionEvents()
	}
	
	class func displayNoData(view: UIView, message: String) {
		
		noDataLbl.textAlignment = .center
		noDataLbl.textColor = #colorLiteral(red: 0.2219038904, green: 0.3019527793, blue: 0.6294562221, alpha: 1)
		noDataLbl.text = message
		noDataLbl.font = UIFont.systemFont(ofSize: 22)
		noDataLbl.sizeToFit()
		noDataLbl.center = CGPoint(x: view.bounds.width / 2, y: view.center.y )
		
		view.addSubview(noDataLbl)
		view.bringSubviewToFront(noDataLbl)
		noDataLbl.isHidden = false
	}
	
	class func hideNoData(view: UIView) {
		noDataLbl.isHidden = true
		noDataLbl.removeFromSuperview()
	}
    // save user id to user defulat
    class func saveUserId(clientId:Int){
        
        def.set(clientId, forKey: Keys.clientId.rawValue)
        def.synchronize()
        restartApp()
    }
    // get client id to user defulat
    class func getUserId()->Int{
        return def.integer(forKey: Keys.clientId.rawValue)
    }

    
    
    class func restartApp(){
        print()
        guard  let window = UIApplication.shared.keyWindow else {return}
        let sb = UIStoryboard(name: "Main", bundle: nil)
        var vc : UIViewController
        if getUserId() == 0 {
            //go to signUp screen
            vc = sb.instantiateInitialViewController()!
            
            
        }
        else {
            // go to home screen
            vc = sb.instantiateViewController(withIdentifier: "EventCalendar")
        }
        
        window.rootViewController = vc

        
    }
    
    static func showAlert( message : String , title : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:{ action in
        }))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }

    
	
}
