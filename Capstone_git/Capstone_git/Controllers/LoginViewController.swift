//
//  LoginViewController.swift
//  Capstone_git
//
//  Created by Mubassir Ahmed Turjo on 3/24/22.
//

import UIKit



public class AppState {
     
     public static var loginDataCol = [loginData]()
}


public struct loginData:Identifiable,Decodable,Encodable{
    public var id=UUID()
    let userName:String
    let userPassword:String
    
    private enum CodingKeys:CodingKey{
        case userName
        case userPassword
    }
}

class LoginViewController: UIViewController,UITextFieldDelegate {

   
    
//    private var loginDataCol = [loginData]()
    
    @IBOutlet weak var errorBox: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        userName.delegate = self
        userPassword.delegate = self
        //adding existing data
        AppState.loginDataCol.append(loginData(userName: "Turjo", userPassword: "1234"))
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginClick(_ sender: Any) {
        
        let loginDataCol = AppState.loginDataCol
        
        
        for login in loginDataCol {
            errorBox.text=""
            if(userName.text!.isEqual(login.userName) && userPassword.text!.isEqual(login.userPassword)){
                changeToHomeScreen()
                return
            }
           
            
            
        }
        errorBox.text = "Please Enter Correct Credentials"
        errorBox.textColor=UIColor.red
 
        
    }
    
    func changeToHomeScreen(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MainTabViewController")
        
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true;
       }
    
    
 

}
