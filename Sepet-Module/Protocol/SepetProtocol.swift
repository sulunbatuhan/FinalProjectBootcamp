//
//  SepetProtocol.swift
//  FoodCourt
//
//  Created by batuhan on 15.09.2022.
//

import Foundation

//Ana protocoller
protocol ViewToPresenterSepetProtocol {
    var sepetInteractor:PresenterToInteractorSepetProtocol? {get set}
    var sepetView:PresenterToViewSepetProtocol? {get set}
    
    func getir(kullanici_adi: String)
    func listesil(kullanici_adi: String, sepet_yemek_id: Int)
    func Ekle(yemek_adi: String,
                    yemek_resim_adi : String,
                    yemek_fiyat : Int,
                    yemek_siparis_adet : Int,
                    kullanici_adi : String)
}

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter:InteractorToPresenterSepetProtocol? {get set}
    
    func sepetiGetir(kullanici_adi: String)
    func sepetSil(kullanici_adi: String, sepet_yemek_id: Int)
    func sepeteEkle(yemek_adi: String,
                    yemek_resim_adi : String,
                    yemek_fiyat : Int,
                    yemek_siparis_adet : Int,
                    kullanici_adi : String)
}

//Taşıyıcı protocoller
protocol InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(yemekListesi:Array<SepetYemekler>)
}

protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(yemekListesi:Array<SepetYemekler>)
}

//Router protocol
protocol PresenterToRouterSepetProtocol {
    static func createModule(ref:SepetVC)
}
