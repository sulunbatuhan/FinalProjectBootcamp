//
//  AnasayfaRouter.swift
//  FoodCourt
//
//  Created by batuhan on 14.09.2022.
//

import Foundation

class AnasayfaRouter : PresenterToRouterAnasayfaProtocol{
    static func createModule(ref: AnasayfaVC) {
        let presenter = AnasayfaPresenter()
        
        //view
        ref.AnasayfaPresenterDelegate = presenter
        
        //presenter
        ref.AnasayfaPresenterDelegate?.anasayfainteractor = AnasayfaInteractor()
        ref.AnasayfaPresenterDelegate?.anasayfaview = ref
        
        // interactor
        ref.AnasayfaPresenterDelegate?.anasayfainteractor?.anasayfapresenter = presenter
    }
    
    
}
