//
//  UserProtocol.swift
//  FoodCourt
//
//  Created by batuhan on 24.09.2022.
//

import Foundation

protocol ViewToPresenterUserProtocol {
    var userInteractor:PresenterToInteractorUserProtocol? {get set}
    var userView:PresenterToViewUserProtocol? {get set}
    
    func getir()
    
}

protocol PresenterToInteractorUserProtocol {
    var userPresenter:InteractorToPresenterUserProtocol? {get set}
    
    func listeGetir()
   
}

//Taşıyıcı protocoller
protocol InteractorToPresenterUserProtocol {
    func presenteraVeriGonder(liste:Array<String>)
}

protocol PresenterToViewUserProtocol {
    func vieweVeriGonder(liste:Array<String>)
}

//Router protocol
protocol PresenterToRouterUserProtocol {
    static func createModule(ref:UserVC)
}
