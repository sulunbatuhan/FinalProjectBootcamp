//
//  LoginVC.swift
//  FoodCourt
//
//  Created by batuhan on 15.09.2022.
//

import UIKit

class LoginVC: UIViewController {

    
    @IBOutlet weak var loginUserText: UITextField!
    @IBOutlet var loginPasswordText: UIView!
    
    @IBOutlet weak var buttonGiris: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      

        buttonGiris.backgroundColor = UIColor.white
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
       
    }
    
    @IBAction func girisYap(_ sender: UIButton) {
        sender.backgroundColor = UIColor(named: "red2")
    }
    

}
