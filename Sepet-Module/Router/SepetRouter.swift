//
//  SepetRouter.swift
//  FoodCourt
//
//  Created by batuhan on 15.09.2022.
//

import Foundation

class SepetRouter : PresenterToRouterSepetProtocol {
  
    
    static func createModule(ref: SepetVC) {
      
        
        
        
        
        
        let presenter = SepetPresenter()
        
        //view
        ref.sepetDelagete = presenter
    
        // presenter
        ref.sepetDelagete?.sepetInteractor = SepetInteractor()
        ref.sepetDelagete?.sepetView = ref
        //interactor
        ref.sepetDelagete?.sepetInteractor?.sepetPresenter = presenter
        
    }
    
    
}
