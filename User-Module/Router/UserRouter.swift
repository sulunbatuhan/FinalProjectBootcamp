//
//  UserRouter.swift
//  FoodCourt
//
//  Created by batuhan on 24.09.2022.
//

import Foundation

class UserRouter : PresenterToRouterUserProtocol {
   static func createModule(ref: UserVC) {
      
       let presenter = UserPresenter()
        
        //view
        ref.userDelegate = presenter
    
        // presenter
       ref.userDelegate?.userInteractor = UserInteractor()
        ref.userDelegate?.userView = ref
        //interactor
        ref.userDelegate?.userInteractor?.userPresenter = presenter
        
    }
    
    
}
