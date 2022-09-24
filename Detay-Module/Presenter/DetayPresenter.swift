//
//  DetayPresenter.swift
//  FoodCourt
//
//  Created by batuhan on 14.09.2022.
//

import Foundation

class DetayPresenter : ViewToPresenterDetayProcotol{
    
    
    var detayInteractor: PresenterToInteractorDetayProtocol?
    
    func ekle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String) {
        detayInteractor?.sepeteEkle(yemek_adi: yemek_adi,
                                    yemek_resim_adi: yemek_resim_adi,
                                    yemek_fiyat: yemek_fiyat,
                                    yemek_siparis_adet: yemek_siparis_adet,
                                    kullanici_adi: kullanici_adi)
    }
    
    
}


