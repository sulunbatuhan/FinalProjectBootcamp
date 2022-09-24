//
//  SepetPresenter.swift
//  FoodCourt
//
//  Created by batuhan on 15.09.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol{
    func Ekle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String) {
        
    }
    
    var sepetView: PresenterToViewSepetProtocol?
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    
   
    func getir(kullanici_adi: String) {
        sepetInteractor?.sepetiGetir(kullanici_adi: kullanici_adi)
    }
    
    func listesil(kullanici_adi: String, sepet_yemek_id: Int) {
        sepetInteractor?.sepetSil(kullanici_adi: kullanici_adi, sepet_yemek_id: sepet_yemek_id)
    }
  
    
   
    
    
}

extension SepetPresenter : InteractorToPresenterSepetProtocol{
    func presenteraVeriGonder(yemekListesi: Array<SepetYemekler>) {
        sepetView?.vieweVeriGonder(yemekListesi: yemekListesi)
    }
    
}

