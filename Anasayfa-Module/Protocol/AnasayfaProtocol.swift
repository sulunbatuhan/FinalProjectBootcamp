//
//  AnasayfaProtocol.swift
//  FoodCourt
//
//  Created by batuhan on 14.09.2022.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol{
    var anasayfainteractor : PresenterToInteractorAnasayfaProtocol?{get set}
    var anasayfaview : PresenterToViewAnasayfaTasiyiciProtocol? {get set}
    
    func yemekleriGetir()
    func ara(keyword : String)
    func sepettekiYemekler()
    
}
protocol PresenterToInteractorAnasayfaProtocol{
    var anasayfapresenter : InteractToPresenAnasayfaTasiyiciProtokol? {get set}
    
    func tumYemekleriGetir()
    func yemekAra(keyword : String)
}




//taşıyıcı Protokoller

protocol InteractToPresenAnasayfaTasiyiciProtokol{
    func presenterVeriGonder(YemekList : Array<Yemekler>)
}
protocol PresenterToViewAnasayfaTasiyiciProtocol{
    func viewVeriGonder(YemekList : Array<Yemekler>)
}

protocol PresenterToRouterAnasayfaProtocol{
    static func createModule(ref:AnasayfaVC)
}
