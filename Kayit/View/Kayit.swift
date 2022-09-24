//
//  Registration.swift
//  FoodCourt
//
//  Created by batuhan on 21.09.2022.
//

import UIKit

class KayitVC: UIViewController {

    
    @IBOutlet weak var regisUserTest: UITextField!
    @IBOutlet weak var registerUserPassword: UITextField!
    @IBOutlet weak var registerPasswordAgain: UITextField!
    
    var userPass  = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(userPass.count)
    }
    
    @IBAction func kayitOl(_ sender: UIButton) {
        if regisUserTest.text != ""{
            let userName = regisUserTest.text
            if registerUserPassword.text != ""{
                if registerUserPassword.text == registerPasswordAgain.text {
                    let password = registerUserPassword.text
                    
               
                    
                    
                    userPass.append(User(userName: userName!, password: password!))
                    UserDefaults.setValue(userName, forKey: "\(password)")
                    
                   dismiss(animated: true)
                }
            }
        }
        
        
        
    }
    
   

}
