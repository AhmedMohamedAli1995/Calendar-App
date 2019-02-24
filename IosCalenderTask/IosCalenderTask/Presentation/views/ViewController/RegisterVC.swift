//
//  RegisterVC.swift
//  IosCalenderTask
//
//  Created by Ahmed Ali on 2/20/19.
//  Copyright © 2019 AHMEDALI. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialSnackbar
import SkyFloatingLabelTextField
import iOSDropDown

class RegisterVC: BaseVC,CountriesDelegate {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var hideandShowOutlet: UIButton!
    @IBOutlet weak var createAccount: UIButton!
    @IBOutlet weak var name: SkyFloatingLabelTextField!
    @IBOutlet weak var email: SkyFloatingLabelTextField!
    @IBOutlet weak var pass: SkyFloatingLabelTextField!
    @IBOutlet weak var country: DropDown!
    @IBOutlet weak var confirmPass: SkyFloatingLabelTextField!
    var iconClick = true
    
    var user = User()
    var countries = [CountriesResponseData]()
    var countriesNames = [String]()
   var countryPresenter : CountriesVCPresenter?
    var imagePicker = UIImagePickerController()
    var base64ImageString : String {
        get{
            if let imageData = #imageLiteral(resourceName: "user-image").pngData() as NSData? {
                return imageData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
            }
            else{
                return ""
             }
        }
        
        set{}
    }
    override func viewDidLoad() {
            super.viewDidLoad()
        countryPresenter = CountriesVCPresenter(view: self)
        countryPresenter!.getCountries()
        setUpCountryMenu()
        setupUserImage()
      
    }
    
    func setUpCountryMenu()  {
        self.country.text = "choose country"
        country.didSelect{(selectedText , index ,id) in
            self.user.country_id = self.countries[index].id!
        }
        country.optionArray = countriesNames
    }
    
    func setContries(data: [CountriesResponseData], names: [String]) {
        country.optionArray = names
        self.countries = data
    }
    
    
    @IBAction func uploadImage(_ sender: Any) {
        imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion:nil)
    }
    
    @IBAction func iconACtion(_ sender: Any) {
        if(iconClick == true) {
            pass.isSecureTextEntry = false
            if let image = UIImage(named: "view") {
                self.hideandShowOutlet.setImage(image, for: .normal)
            }
        } else {
            pass.isSecureTextEntry = true
            if let image = UIImage(named: "hide") {
                self.hideandShowOutlet.setImage(image, for: .normal)
            }
        }
        
        iconClick = !iconClick
    }
    
    @IBAction func createAcount(_ sender: Any) {
        
        if Validation.isEmbity(str: name.text!){
            SnackBarManager.snackBarWith(message: "Invalid Name")
            return
        }
        if Validation.isEmbity(str: email.text!) || !Validation.isValidEmail(enteredEmail: email.text!) {
            SnackBarManager.snackBarWith(message: "Invalid Email ")
            return
        }

        if Validation.isEmbity(str: country.text!)  {
            SnackBarManager.snackBarWith(message: "Please Chose Country")
            return
        }
        if Validation.isEmbity(str: pass.text!) || !Validation.isPasswordValid(pass.text!) {
            SnackBarManager.snackBarWith(message: "Password should be between 6 and 12 digits")
            return
        }
        
      
        if Validation.isEmbity(str: confirmPass.text!) {
            SnackBarManager.snackBarWith(message: "Invalid Password")
            return
        }else if pass.text != confirmPass.text{
            SnackBarManager.snackBarWith(message: "Password doesn't match !")
            return
        }
        
        
        user.name = name.text!
        user.email = email.text!
        user.password = pass.text!
        user.image = base64ImageString
        
        RegisterService.signUp(url: URLs.registerURL.rawValue, user: user, completion: {error,response in
            if(error == nil){
                print("userId is \(response)")
                let userId:String =  response as! String
               
                HelperFunctions.saveUserId(clientId: Int(userId) ?? 0)
            }
        })
        
    }
    func setupUserImage(){
        imagePicker.delegate = self
        userImage.layer.cornerRadius = userImage.frame.size.height / 2
        userImage.clipsToBounds = true
    }
    
}
extension RegisterVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.editedImage] as? UIImage {
            userImage.image = pickedImage
            if let imageData = pickedImage.pngData() as NSData? {
                base64ImageString = imageData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
            }
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
  }
}

