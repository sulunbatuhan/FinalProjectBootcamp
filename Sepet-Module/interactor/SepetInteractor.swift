//
//  SepetInteractor.swift
//  FoodCourt
//
//  Created by batuhan on 15.09.2022.
//

import Foundation
import Alamofire

class SepetInteractor : PresenterToInteractorSepetProtocol{
  
    
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
   
    func sepetiGetir(kullanici_adi: String) {
    let params : Parameters = ["kullanici_adi" : kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters:  params).response{
            response in
            if let data = response.data {
                do {
                    let gelenVeri = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data)
                    if let liste = gelenVeri.sepet_yemekler{
                       self.sepetPresenter?.presenteraVeriGonder(yemekListesi: liste)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        
        
      
    }
    
    
    
    
    func sepetSil(kullanici_adi: String, sepet_yemek_id: Int) {
      var params : Parameters = ["kullanici_adi": kullanici_adi,"sepet_yemek_id":sepet_yemek_id]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method:.post,parameters:params ).response{
            response in
            if let data = response.data {
                do {
                   if let gelenVeri = try JSONSerialization.jsonObject(with: data) as? [String : Any]{
                        print(gelenVeri)
                        
                        self.sepetiGetir(kullanici_adi: kullanici_adi)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func sepeteEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String) {
        
    }
    
    
}
