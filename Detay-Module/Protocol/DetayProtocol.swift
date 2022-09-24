//
//  DetayProtocol.swift
//  FoodCourt
//
//  Created by batuhan on 14.09.2022.
//

import Foundation

protocol ViewToPresenterDetayProcotol{
    var detayInteractor : PresenterToInteractorDetayProtocol? {get set}
    
    func ekle(yemek_adi: String,
                    yemek_resim_adi : String,
                    yemek_fiyat : Int,
                    yemek_siparis_adet : Int,
                    kullanici_adi : String)
    
}

protocol PresenterToInteractorDetayProtocol{
    func sepeteEkle(yemek_adi: String,
                    yemek_resim_adi : String,
                    yemek_fiyat : Int,
                    yemek_siparis_adet : Int,
                    kullanici_adi : String)
}



protocol PresenterToRouter{
    static func createModule(ref:DetayVC)
}
