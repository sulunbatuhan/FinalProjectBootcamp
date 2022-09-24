//
//  extension.swift
//  FoodCourt
//
//  Created by batuhan on 22.09.2022.
//

import Foundation
import UIKit

extension UIViewController{
    func ViewDesign(){
        self.navigationItem.title = "Tıkla Gelsin"
        let design = UINavigationBarAppearance()
        design.backgroundColor = UIColor(named: "red")
       design.titleTextAttributes = [.foregroundColor : UIColor.white,.font:UIFont.boldSystemFont(ofSize: 25)]
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.scrollEdgeAppearance = design
        navigationController?.navigationBar.compactAppearance = design
        navigationController?.navigationBar.standardAppearance = design
       
    }
}
