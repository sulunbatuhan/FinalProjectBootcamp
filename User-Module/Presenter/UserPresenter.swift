//
//  UserPresenter.swift
//  FoodCourt
//
//  Created by batuhan on 24.09.2022.
//

import Foundation

class UserPresenter : ViewToPresenterUserProtocol{
   
    
    var userInteractor: PresenterToInteractorUserProtocol?
    
    var userView: PresenterToViewUserProtocol?
    
   
    func getir() {
        userInteractor?.listeGetir()
    }
    
    
}



extension UserPresenter : InteractorToPresenterUserProtocol{
    func presenteraVeriGonder(liste : Array<String>) {
        userView?.vieweVeriGonder(liste: liste)
    }
    
    
}
