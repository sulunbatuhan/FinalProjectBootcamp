//
//  UserVC.swift
//  FoodCourt
//
//  Created by batuhan on 22.09.2022.
//

import UIKit

class UserVC: UIViewController {

    @IBOutlet weak var userTable: UITableView!
    
    var userTableSettings = [String]()
    var userDelegate : ViewToPresenterUserProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTable.delegate = self
        userTable.dataSource = self

       
        self.ViewDesign()
        UserRouter.createModule(ref: self)
    }
    
  

}

extension UserVC : PresenterToViewUserProtocol{
    func vieweVeriGonder(liste: Array<String>) {
        userTableSettings = liste
    }
    
    
}


// MARK: - Extension TableViewDelegate
extension UserVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userTableSettings.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rows = userTableSettings[indexPath.row]
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        cell.textLabel?.text = rows
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rows = userTableSettings[0]
        
    }
}

