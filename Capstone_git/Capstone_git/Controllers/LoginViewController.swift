//
//  LoginViewController.swift
//  Capstone_git
//
//  Created by user202461 on 3/24/22.
//

import UIKit

struct loginData:Identifiable,Decodable{
    var id=UUID()
    let userName:String
    let userPassword:String
    
    private enum CodingKeys:CodingKey{
        case userName
        case userPassword
    }
}

class LoginViewController: UIViewController {

   
    
    private var loginDataCol = [loginData]()
    
    @IBOutlet weak var errorBox: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loadLogins()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginClick(_ sender: Any) {
        
      
        for login in loginDataCol {
            errorBox.text=""
            if(userName.text!.isEqual(login.userName) && userPassword.text!.isEqual(login.userPassword)){
                changeToHomeScreen()
                return
            }
            userName.text=""
            userPassword.text=""
            errorBox.text = "Please Enter Correct Credentials"
            
        }
        errorBox.textColor=UIColor.red
 
        
    }
    
    func changeToHomeScreen(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "homeScreen")
                self.present(newViewController, animated: true, completion: nil)
    }
    
    //Loading saved login data
    func loadLogins(){
        
        guard let path=Bundle.main.path(forResource: "loginData", ofType: "json")else{
            fatalError("File Location not found")
            
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {return}
        
        let logindata = try? JSONDecoder().decode([loginData].self,from: data)
        if let logindata=logindata{
            self.loginDataCol=logindata
        }
        
    }

}
