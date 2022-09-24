//
//  AnasayfaPresenter.swift
//  FoodCourt
//
//  Created by batuhan on 14.09.2022.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol{
    
    
    var anasayfainteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaview: PresenterToViewAnasayfaTasiyiciProtocol?
    
   
    
    func yemekleriGetir() {
        anasayfainteractor?.tumYemekleriGetir()
    }
    
    func ara(keyword: String) {
        anasayfainteractor?.yemekAra(keyword: keyword)
    }
    func sepettekiYemekler() {
        
    }
    
}
extension AnasayfaPresenter : InteractToPresenAnasayfaTasiyiciProtokol{
    func presenterVeriGonder(YemekList: Array<Yemekler>) {
        anasayfaview?.viewVeriGonder(YemekList: YemekList)
    }
    
    
}
