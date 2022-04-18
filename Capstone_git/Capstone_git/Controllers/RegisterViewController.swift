//
//  RegisterViewController.swift
//  Capstone_git
//
//  Created by Mubassir Ahmed Turjo on 3/24/22.
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
        
        if(userName == "" || userPassword == "" )
        {
            name.layer.borderWidth=1
            name.layer.borderColor=CGColor.init(red: 255, green: 0, blue: 0, alpha: 1)

            password.layer.borderWidth=1
            password.layer.borderColor=CGColor.init(red: 255, green: 0, blue: 0, alpha: 1)
            return
        }
        
        let newUser:loginData = loginData(userName: userName, userPassword: userPassword)
        AppState.loginDataCol.append(newUser)
        
        changeToLoginScreen();        
    }
    
    func changeToLoginScreen()
    {
       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
       let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginController")

       newViewController.modalPresentationStyle = .fullScreen
       self.present(newViewController, animated: true, completion: nil)
    }

}



