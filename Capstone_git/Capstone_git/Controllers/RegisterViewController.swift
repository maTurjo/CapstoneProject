//
//  RegisterViewController.swift
//  Capstone_git
//
//  Created by user202461 on 3/24/22.
//

import UIKit

class RegisterViewController: UIViewController,UITextFieldDelegate {
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        name.delegate=self
        
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
  

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    
    @IBOutlet weak var contactNumber: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func RegisterNow(_ sender: Any) {
       
        let userName=name.text!
        let userPassword=password.text!
        
        let newUser:loginData = loginData(userName: userName, userPassword: userPassword)
                        
        AppState.loginDataCol.append(newUser)
        
      
        
    }
    
    
 
 
    

}



