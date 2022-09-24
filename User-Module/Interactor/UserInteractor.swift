//
//  UserInteractor.swift
//  FoodCourt
//
//  Created by batuhan on 24.09.2022.
//

import Foundation

class UserInteractor : PresenterToInteractorUserProtocol{
   
    
    var userPresenter: InteractorToPresenterUserProtocol?
    
    func listeGetir() {
        var liste = [String]()
        liste.append("Adresler")
        liste.append("Siparişler")
        liste.append("Cüzdan")
        liste.append("Ayarlar")
        userPresenter?.presenteraVeriGonder(liste: liste)
    }
  
    
    
}
